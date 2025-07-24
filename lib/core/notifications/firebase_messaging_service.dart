import 'dart:developer';
import 'dart:io';
import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/core/notifications/flutter_local_notification.dart';
import 'package:consult_me/feature/Call/video.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


class FirebaseMessagingService {
  FirebaseMessagingService._internal();

  static final FirebaseMessagingService _instance = FirebaseMessagingService._internal();

  factory FirebaseMessagingService.instance() => _instance;

  NotificationsService? _localNotificationsService;

  Future<void> init({required NotificationsService localNotificationsService}) async {
    _localNotificationsService = localNotificationsService;

    await Firebase.initializeApp(); // Important!
    await _requestPermission();
    await _handlePushNotificationsToken();


    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
   /// handle notification when app is in foreground
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
   /// handle notification when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
   
    /// handle notification when app is in Terminated state
     FirebaseMessaging.instance.getInitialMessage().then((initialMessage) {

  if (initialMessage != null) {
       NavigationService.push(
    const Video(),
    );
    
    }
    });
  

    _listenForTokenRefresh();
  }

  Future<void> _handlePushNotificationsToken() async {
    String? token;
    if (Platform.isIOS) {
      token = await FirebaseMessaging.instance.getAPNSToken();
    } else {
      token = await FirebaseMessaging.instance.getToken();
    }

    if (token == null) {
      debugPrint('Failed to get FCM/APN token');
      return;
    }

   
   
  }

  void _listenForTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      debugPrint('FCM token refreshed: $fcmToken');
      // Optionally re-upload token
    }).onError((error) {
      debugPrint('Error refreshing FCM token: $error');
    });
  }

  Future<void> _requestPermission() async {
    final result = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    debugPrint('User granted permission: ${result.authorizationStatus}');
  }

  void _onForegroundMessage(RemoteMessage message) {
    debugPrint('Foreground message received: ${message.data.toString()}');
    final notificationData = message.notification;
    if (notificationData != null) {
      _localNotificationsService?.showNotification(
        notificationData.title,
        notificationData.body,
        message.data.toString(),
      );
    
    }
  }

  void _onMessageOpenedApp(RemoteMessage message) async{
   
  
     NavigationService.push(Video());

  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
 
  NavigationService.push(Video());
  log('Background message received: ${message.data.toString()}');

}