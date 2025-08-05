import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationService {

  static Future<void> sendNotification(
      String deviceToken, String title, String body) async {
    final String accessToken ='ya29.a0AS3H6NyJStvcsELfgLLQC3Wyw04ceoKci4_PKQy-fotwTOLn_9O20feNj_nIbzT5s7R2WD6nPkWk6Phts4BoM6Y8VZs7-OBeHp1ZsH575HWLqjQgbhbdKhVh4CgP665QweYPzqWYotZSFM1F_VwGCekcY7pteKF9ugQO_mzDaCgYKAXMSARESFQHGX2MiT8d_uhngqt5KKterzHxGYQ0175';
    String endpointFCM =
        'https://fcm.googleapis.com/v1/projects/estasherny-43801/messages:send';
    final Map<String, dynamic> message = {
      "message": {
        "token":  'dKHRyD0eT66A6P4FS4WOf4:APA91bFJTt0lmN9TIjB_fHGpo6vFMp9lFh5R2Z-MFbYvTAhZSBTEM67wuadbN1EsCzhGuADu4JoId89n4morzwWdeCj81w5BlcJi8OKGnxcCT45jl20Ze_A',//deviceToken,
        "notification": {"title": title, "body": body},
        "data": {
          "route": "serviceScreen",
        }
      }
    };

    final http.Response response = await http.post(
      Uri.parse(endpointFCM),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('Notification sent successfully');
    } else {
      print('Failed to send notification');
    }
  }


}