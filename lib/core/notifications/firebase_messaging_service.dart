// import 'dart:developer';
// import 'dart:io';
// import 'package:consult_me/core/navigation/navigation_service.dart';
// import 'package:consult_me/core/notifications/flutter_local_notification.dart';
// import 'package:consult_me/features/call/data/models/call_model.dart';
// import 'package:consult_me/features/call/data/models/my_call_model.dart';
// import 'package:consult_me/features/call/presentation/pages/video.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
//
// class FirebaseMessagingService {
//   FirebaseMessagingService._internal();
//
//   static final FirebaseMessagingService _instance = FirebaseMessagingService._internal();
//
//   factory FirebaseMessagingService.instance() => _instance;
//
//   NotificationsService? _localNotificationsService;
//
//
//    Future<void> init({required NotificationsService localNotificationsService}) async {
//     _localNotificationsService = localNotificationsService;
//     await Firebase.initializeApp(); // Important!
//     await _requestPermission();
//
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//    /// handle notification when app is in foreground
//     FirebaseMessaging.onMessage.listen(_onForegroundMessage);
//    /// handle notification when app is in background
//     FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
//
//     /// handle notification when app is in Terminated state
//      FirebaseMessaging.instance.getInitialMessage().then((initialMessage) {
//
//   if (initialMessage != null) {
//      navigationToVideo(initialMessage);
//     }
//
//     });
//
//
//     _listenForTokenRefresh();
//   }
//
// Future<void>subscribeToTopic(String topic)async{
//   await FirebaseMessaging.instance.subscribeToTopic(topic);
// }
//   Future<String> getToken() async {
//     String? token;
//     if (Platform.isIOS) {
//       token = await FirebaseMessaging.instance.getAPNSToken();
//     } else {
//       token = await FirebaseMessaging.instance.getToken();
//
//     }
//
//     if (token == null) {
//       debugPrint('Failed to get FCM/APN token');
//       return '';
//     }
//      debugPrint('FCM/APN token: $token');
// return token;
//
//
//   }
//
//
//   void _listenForTokenRefresh() {
//     FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
//       debugPrint('FCM token refreshed: $fcmToken');
//       // Optionally re-upload token
//     }).onError((error) {
//       debugPrint('Error refreshing FCM token: $error');
//     });
//   }
//
//   Future<void> _requestPermission() async {
//     final result = await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     debugPrint('User granted permission: ${result.authorizationStatus}');
//   }
//
//   void _onForegroundMessage(RemoteMessage message) {
//     debugPrint('Foreground message received: ${message.data.toString()}');
//     final notificationData = message.notification;
//     if (notificationData != null) {
//       _localNotificationsService?.showNotification(
//         notificationData.title,
//         notificationData.body,
//         message.data['data'],
//       );
//
//     }
//   }
//
//   void _onMessageOpenedApp(RemoteMessage message) async{
//   navigationToVideo(message);
//
//   }
//
//
// }
//
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//
//   navigationToVideo(message);
//
//
// }
//  void navigationToVideo(RemoteMessage message) {
//    MyCallModel call = MyCallModel.fromJson(message.data['data']);
//        NavigationService.push(Video(call: call,));
//   }