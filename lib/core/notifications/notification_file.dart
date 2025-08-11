import 'dart:convert';
import 'dart:io';
import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/features/call/data/models/my_call_model.dart';
import 'package:consult_me/features/call/presentation/pages/video.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../services/local_services.dart';

/// Comprehensive notification service handling Firebase Cloud Messaging (FCM),
/// local notifications, and push notifications with various notification types.
class NotificationService {
  NotificationService._internal();
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService.instance() => _instance;

  static final AwesomeNotifications _awesomeNotifications = AwesomeNotifications();
  static const String _channelKey = 'basic_channel';
  static const String _channelGroupKey = 'basic_channel';
  static const String _projectId = 'estasherny-43801';
  static const String _bigPictureChannelKey = 'big_picture_channel';
  static const String _progressChannelKey = 'progress_channel';
  static const String _actionChannelKey = 'action_channel';

  /// Initialize Firebase and notification services
  Future<void> init() async {

    // Initialize Awesome Notifications with multiple channels
    await _initializeAwesomeNotifications();

    // Request notification permissions
    await _requestPermission();

    // Set up Firebase Messaging handlers
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // Handle notifications when app is terminated
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _navigationToVideo(initialMessage);
    }

    // Listen for token refresh
    _listenForTokenRefresh();

    // Start listening for notification interactions
    await _startListeningNotificationEvents();
  }

  /// Initialize Awesome Notifications with multiple channel configurations
  Future<void> _initializeAwesomeNotifications() async {
    await _awesomeNotifications.initialize(
      null, // Use default icon
      [
        NotificationChannel(
          channelKey: _channelKey,
          channelName: 'Basic Notifications',
          channelDescription: 'Basic notifications for users',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          ledColor: Colors.white,
          channelShowBadge: false,
          locked: true,
          defaultRingtoneType: DefaultRingtoneType.Ringtone,
          onlyAlertOnce: true,
        ),
        NotificationChannel(
          channelKey: _bigPictureChannelKey,
          channelName: 'Big Picture Notifications',
          channelDescription: 'Notifications with large images',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.High,
          ledColor: Colors.white,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification,
        ),
        NotificationChannel(
          channelKey: _progressChannelKey,
          channelName: 'Progress Notifications',
          channelDescription: 'Notifications showing progress',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Low,
          ledColor: Colors.white,
          channelShowBadge: false,
          onlyAlertOnce: true,
        ),
        NotificationChannel(
          channelKey: _actionChannelKey,
          channelName: 'Action Button Notifications',
          channelDescription: 'Notifications with interactive buttons',
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.High,
          ledColor: Colors.white,
          channelShowBadge: true,
          defaultRingtoneType: DefaultRingtoneType.Notification,
        ),
      ],
      debug: true,
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: _channelGroupKey,
          channelGroupName: 'Notification Categories',
        ),
      ],
    );
  }

  /// Request notification permissions
  Future<void> _requestPermission() async {
    try {
      final result = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('User granted permission: ${result.authorizationStatus}');
    } catch (e) {
      debugPrint('Error requesting permission: $e');
    }
  }

  /// Get FCM or APNS token based on platform
  Future<String> getToken() async {
    try {
      String? token;
      if (Platform.isIOS) {
        token = await FirebaseMessaging.instance.getAPNSToken();
      } else {
        token = await FirebaseMessaging.instance.getToken();
      }
      if (token == null) {
        debugPrint('Failed to get FCM/APNS token');
        return '';
      }
      debugPrint('FCM/APNS token: $token');
      return token;
    } catch (e) {
      debugPrint('Error getting token: $e');
      return '';
    }
  }

  /// Subscribe to a specific topic
  Future<void> subscribeToTopic(String topic) async {
    try {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
      debugPrint('Subscribed to topic: $topic');
    } catch (e) {
      debugPrint('Error subscribing to topic: $e');
    }
  }

  /// Listen for FCM token refresh
  void _listenForTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      debugPrint('FCM token refreshed: $fcmToken');
    }).onError((error) {
      debugPrint('Error refreshing FCM token: $error');
    });
  }

  /// Handle foreground messages
  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('Foreground message received: ${message.data}');
    final notificationData = message.notification;
    if (notificationData != null) {
      showInstantNotification(
        title: notificationData.title ?? 'Notification',
        body: notificationData.body ?? '',
        payload: message.data['data'],
      );
    }
  }

  /// Handle messages opened from background
  void _onMessageOpenedApp(RemoteMessage message) {
    _navigationToVideo(message);
  }

  /// Handle background messages
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    _navigationToVideo(message);
  }

  /// Navigate to video call screen
  static void _navigationToVideo(RemoteMessage message) {
    if (message.data['data'] != null) {
      try {
        final call = MyCallModel.fromJson(message.data['data']);
        NavigationService.push(Video(call: call));
      } catch (e) {
        debugPrint('Error navigating to video: $e');
      }
    }
  }

  /// Show instant notification
  Future<void> showInstantNotification({
    required String title,
    required String body,
    Map<String,dynamic>? payload,
    int? id,
  }) async {
    try {
      final notificationId = id ?? DateTime.now().millisecondsSinceEpoch.remainder(100000);
      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: _channelKey,
          title: title,
          body: body,
          payload: payload != null ?toStringMap(payload) : null,
          notificationLayout: payload != null ? NotificationLayout.Default : NotificationLayout.Inbox,
        ),
      );
      debugPrint('Instant notification shown: $title');
    } catch (e) {
      debugPrint('Error showing instant notification: $e');
    }
  }

  /// Schedule a notification
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    Map<String,dynamic>? payload,
    int? id,
  }) async {
    try {
      final notificationId = id ?? DateTime.now().millisecondsSinceEpoch.remainder(100000);
      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: _channelKey,
          title: title,
          body: body,
          payload: payload != null ? toStringMap(payload) : null,
          notificationLayout: payload != null ? NotificationLayout.Default : NotificationLayout.Inbox,
        ),
        schedule: NotificationCalendar.fromDate(
          date: scheduledTime,
          allowWhileIdle: true,
          preciseAlarm: true,
        ),
      );
      debugPrint('Notification scheduled for: $scheduledTime');
    } catch (e) {
      debugPrint('Error scheduling notification: $e');
    }
  }

  /// Show notification with big picture
  Future<void> showBigPictureNotification({
    required String title,
    required String body,
    required String bigPictureUrl,
    Map<String,dynamic>? payload,
    int? id,
  }) async {
    try {
      final notificationId = id ?? DateTime.now().millisecondsSinceEpoch.remainder(100000);
      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: _bigPictureChannelKey,
          title: title,
          body: body,
          bigPicture: bigPictureUrl,
          notificationLayout: NotificationLayout.BigPicture,
          payload: payload != null ? toStringMap(payload) : null,
        ),
      );
      debugPrint('Big picture notification shown: $title');
    } catch (e) {
      debugPrint('Error showing big picture notification: $e');
    }
  }

  /// Show progress bar notification
  Future<void> showProgressNotification({
    required String title,
    required String body,
    required double progress,
    double maxProgress = 100,
    String? payload,
    int? id,
  }) async {
    try {
      final notificationId = id ?? DateTime.now().millisecondsSinceEpoch.remainder(100000);
      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: _progressChannelKey,
          title: title,
          body: body,
          payload: payload != null ? {'data': payload} : null,
          notificationLayout: NotificationLayout.ProgressBar,
          progress: progress.clamp(0, 100), // Ensure progress is between 0 and 100

        ),
      );
      debugPrint('Progress notification shown: $title, Progress: $progress/$maxProgress');
    } catch (e) {
      debugPrint('Error showing progress notification: $e');
    }
  }

  /// Show notification with action buttons
  Future<void> showActionButtonNotification({
    required String title,
    required String body,
    required List<NotificationActionButton> actionButtons,
    String? payload,
    int? id,
  }) async {
    try {
      final notificationId = id ?? DateTime.now().millisecondsSinceEpoch.remainder(100000);
      await _awesomeNotifications.createNotification(
        content: NotificationContent(
          id: notificationId,
          channelKey: _actionChannelKey,
          title: title,
          body: body,
          payload: payload != null ? {'data': payload} : null,
          notificationLayout: NotificationLayout.Default,
        ),
        actionButtons: actionButtons,
      );
      debugPrint('Action button notification shown: $title');
    } catch (e) {
      debugPrint('Error showing action button notification: $e');
    }
  }
  /// Convert Map<String, dynamic> to Map<String, String?>?
static  Map<String, String?>? toStringMap(Map<String, dynamic>? input) {
    if (input == null) {
      debugPrint('Input map is null, returning null');
      return null;
    }
    try {
      final result = <String, String?>{};
      input.forEach((key, value) {
        result[key] = value?.toString();
      });
      debugPrint('Converted to String map: $result');
      return result;
    } catch (e) {
      debugPrint('Error converting to String map: $e');
      return null;
    }
  }

  /// Convert Map<String, String?>? to Map<String, dynamic>
 static Map<String, dynamic> toDynamicMap(Map<String, String?>? input) {
    if (input == null) {
      debugPrint('Input map is null, returning empty dynamic map');
      return {};
    }
    try {
      final result = <String, dynamic>{};
      input.forEach((key, value) {
        result[key] = value;
      });
      debugPrint('Converted to dynamic map: $result');
      return result;
    } catch (e) {
      debugPrint('Error converting to dynamic map: $e');
      return {};
    }
  }

  /// Start listening for notification events
  Future<void> _startListeningNotificationEvents () async {
    debugPrint('Starting notification event listeners');
    _awesomeNotifications.setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
    );
  }

  /// Handle notification actions
  static Future<void> _onActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint('Notification action received: ${receivedAction.buttonKeyPressed}');
    if (receivedAction.payload != null && receivedAction.payload!['data'] != null) {
      try {
        Map<String, dynamic> json = toDynamicMap( receivedAction.payload!);
        final call = MyCallModel.fromJson(json['data']);
        NavigationService.push(Video(call: call));
      } catch (e) {
        debugPrint('Error handling notification action: $e');
      }
    }
  }

  /// Get Firebase access token for sending push notifications
  static Future<String> _getAccessToken() async {
    const serviceAccountJson = {
      "type": "service_account",
      "project_id": _projectId,
      "private_key_id": "fc2c0cc48b52e22a3e14b94cade969df80dc40b3",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCyLVqHJ1uQsiG1\nI9dh27/SKErsCL3ZTPpStw8h4eYBRX1ujTyrCRL1SmTrDyCFlNMzH+efLpiJgc9c\nYY/frwvtkbKGtWhhWBCXpJTtoDUvq8agH0JWkIFGFsKFPYuA6Bu7vRkcJNLivBI3\nXH57WMz9ThNNmb9Z1WrBKw+jUhCbUIpWHtO9QmxvGgMY6L0ZqKvRnh1tWjhmhcWA\n0nGNkGMqYmUys5YMOBgRTFY95CQo9+0sD2e+63u15QNpjZq3iVRiDLdwHt1QahOt\n/+lzJL7NmxupubGhkojxUq+URr0yM37+TNApR/6xAdbaqPiKt4J8oFM/4H1OYAXZ\npXYs2fydAgMBAAECggEAIwMCfPhg58f5E60dT59szBEa19LH64FS1xodoRzQo4NS\nKH0cZMd9sDGULxRj4Zvi/HLSgtcXJj4Zzx9ktCGjiGVO3WWcQzSY3hN7KE6I5Psu RADIO Jpy93mC65ljmlGQJm6UAfh2kZ4Fc5yzpr3M/b2F9tnC3HlKN5UsolRivE/q2RK50\nucaS+kmAX9f9ZJ6Ez8dyAhEl6kHl7HSV3NmBJsEL0/4RK565DlND4VsqEXy8GS24\nEV1UbUIVvjSzkfzE9Zc1WMkR288AGajsUtakuAZ7vjpBisgkterBTblDQ4UTSMlS\nGZ5N12wlIAMftAV9OhG9irecHY2pw1dKS0e6bhvtyQKBgQDldM3OuY2i+G4Xz7H+\nliW8JgmRitksUVLQGUNh2c/wZ2ndfJD8ozFZhmWSktWDv40iuEN7YA2GimNmcMym\nTBE+Wj72suAVBUzvpFi7iKv0lb7SpcWXjZU0yVW+1kaDqEcTTw2YMp/s6kvjN/k2\nkAy5sykwkzakedw9Y1yQ3BZjMwKBgQDGyfPuiMQKcNHnI5rTYW8Z8UCocVFLaOsw\niRZRLZDEZ0B37xIBwOJxAK7MAR3cr6w1D558AOjKqcScAPoRWzRwhOm6whQfyXu5\niBA6YvQffAFYECAp3Fbg7cV/navNmWrAyYTOLHLxNiWOqvjjGytys9B0Wn0X59sZ\nKK1eij8g7wKBgQDd5pa+C/4olB5MEsTtEyGNEjAAu4mI7WCr9TKP58fLkwbzdmr0\nl5G7JVkHZc7s6YtA/3frUZni+eRlBkMzs66dYUMw6w3/5i9gNczGF8dL8qEnL7+l\n7/tSoD63Hpv06QFLcBESlirJQFCBffkZxxjc4Q0ZbPpMCfwL5rySuxtkztwKBgQCp\n4dbT6A9ZONc5J8VdlevDiNgP2191CYHMparrzvvjzLVciXOjCfq6RbIb52xkt8B8\nTA/Nu102LOU3yOHsSTxEWGICV2+pRp+0i2IK85va+DeR0Z4bCBE7AhgBGnbDKrP/\nc3hKVdQY7YQlK1mtg/+ac67WcKps7pjgJFIc9BpFAwKBgQDBewY7HaTaxlxFhs35\nfhtAa4nMmg+1GidnHKhg9tVUjBTsw4dioWq8SS8hHwFsC7xt+h5dBxjwt7xFtHDa\nsTUToE0xIAyy3a6VDGmUy3QTKEFP9DfJ8Cb9FLWAI3NXRDBMJ72t7+HkNGgRNXgD\nH9BhREN21cQwDeYg1V1ZHPYQPA==\n-----END PRIVATE KEY-----\n",
      "client_email": "ownerest@estasherny-43801.iam.gserviceaccount.com",
      "client_id": "104964778386686279867",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1 Metadata/x509/ownerest%40estasherny-43801.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };

    const scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    try {
      final client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );
      final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );
      client.close();
      return credentials.accessToken.data;
    } catch (e) {
      debugPrint('Error obtaining access token: $e');
      return '';
    }
  }

  /// Send push notification
  Future<void> sendPushNotification({
    required String deviceToken,
    required String title,
    required String body,
    required MyCallModel data,
  }) async {
    try {
      final accessToken = await _getAccessToken();
      if (accessToken.isEmpty) {
        debugPrint('Failed to obtain access token');
        return;
      }

      final endpointFCM = 'https://fcm.googleapis.com/v1/projects/$_projectId/messages:send';
      final message = {
        "message": {
          "token": deviceToken,
          "notification": {"title": title, "body": body},
          "data": data.toJson(),
        },
      };

      final response = await sl<Dio>().post(
        endpointFCM,
        options: Options(headers:  {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },),
        data: jsonEncode(message),
      );

      if (response.statusCode == 200) {
        debugPrint('Push notification sent successfully');
      } else {
        debugPrint('Failed to send push notification: ${response.data}');
      }
    }on DioException catch (e) {
      debugPrint('Error sending push notification: $e');
    }
  }
}