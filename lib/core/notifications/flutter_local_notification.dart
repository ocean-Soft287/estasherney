import 'dart:ui';
import 'dart:developer';
import 'dart:isolate';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/core/notifications/notification_model.dart';
import 'package:consult_me/patient/Call/video.dart';
import 'package:flutter/material.dart';

class NotificationsService {
static final  awesomeNotifications = AwesomeNotifications();

  Future<void> showNotification(String? title, String? body, Map<String, String?>? payload,) async {
    final id = DateTime.now().millisecondsSinceEpoch.remainder(100000);

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        payload:payload ,
        notificationLayout: payload != null ? NotificationLayout.Default : NotificationLayout.Inbox,
      ),
    );
     await startListeningNotificationEvents();

  }

  static ReceivePort? receivePort;
   Future<void> init() async {
    await awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelKey: "basic_channel",
          channelName: 'Offers',
          channelDescription: "Offers For Users",
          defaultColor: const Color(0xFF9D50DD),
          importance: NotificationImportance.Max,
          ledColor: Colors.white,
          channelShowBadge: false,
          locked: true,
          defaultRingtoneType: DefaultRingtoneType.Ringtone,
          onlyAlertOnce: true,
        )
      ],
      debug: true,
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel',
          channelGroupName: 'Category tests',
        )
      ],
    );
  }


static Future<void> startListeningNotificationEvents() async {
    debugPrint("check data with start listing");
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
    );
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {

      debugPrint(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
       await executeLongTaskInBackground();
   
    } else {
      if (receivePort == null) {
        debugPrint(
            'onActionReceivedMethod was called inside a parallel dart isolate.');
               go_to_video(receivedAction.payload!);

   
      }

      debugPrint("check data with receivedAction 3${receivedAction.buttonKeyInput}");

      return onActionReceivedImplementationMethod(receivedAction);
    }

}

   static void go_to_video(Map<String, dynamic> message) {
     final model =  AgoraCallModel.fromJson(message);
      NavigationService.push(Video(model: model, ));
  }

  static Future<void> onActionReceivedImplementationMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.title == "") {
      log("check data with receivedAction sssss${receivedAction.title}");
go_to_video(receivedAction.payload!);    }
  
  }

  static Future<void> executeLongTaskInBackground() async {
  
  }

}