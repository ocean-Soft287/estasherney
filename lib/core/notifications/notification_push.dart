// import 'dart:convert';
// import 'dart:developer';
// import 'package:consult_me/features/call/data/models/my_call_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:googleapis_auth/auth_io.dart' as auth;
//
// class NotificationService {
//   static Future<String> getAccessToken() async {
//     final serviceAccountJson = {
//       "type": "service_account",
//       "project_id": "estasherny-43801",
//       "private_key_id": "0702573e3ed0de048a2f031f6a2a04da179c2688",
//       "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1WBi4fT04FeP+\njkRIrDQglvATF3ncWMzmpIKKYjYaaVsaR4XlpbgujJO4NM/MN8+TG7dzkM35HclS\n2KAwOA4fE71C5ZZ1G9HBzAhOhKztmU7B3gp37aQFc2Ufcgk81NZFdt7ewaZM48bv\nvJh5kL+KoPJlrgBPaPTWw+VZfkrjg8MglbQ8LQCpyxN9o/siwaK+RhB1DAnnMSfZ\n5Ct1IHuQOXeMzcbaW0SC+HoyUXo2n4Tl0RJ/BJTThcNfsJiGY4kGtqvJ2ICfVLr+\njM3qJ1RfSPfPS23ZWSq+vMMR3rmPc96ZUbhqnl9JJoXRGSl8RW6ytaDq5uvfhZn+\nbUqbOk2xAgMBAAECggEAAs+Q0ga8bL6vng/m1GzJYc4vHk+jR5hfhC1tec9CBQyo\nIScVxuiHu1550W2NoT3l93Ly9+1JGQT2fHSPvpGW2/HUkZlxCKOHz7n9sLhfHQ9u\n1GPQfBmEjOJUEV3FUYJfyBu6on+kSA2xhSCiaSN2iZO7MBrnZbOz9FJ83wNNbjtz\nTvSbeT/u0UDH9/4fNDpQQsOy5R00DWZg32IffHvnDnUYilB6FQnmDiIWumeo96zt\nTsT5HgywZlhEa833MMNWilZjV19LVHO+Rgss6rysmY2kT8qQ+C6E8sZPDAU6Hupo\nS3Yu0QsfChWFIhc22REOnTfVXaY76K46pPIZCjSCQQKBgQD0KFuWPrZkjjr8Izii\nj2Zbp+z0Ja26MFxVTQrwULzzh0C3wYrGdmwwjXndK7DnDTP5KvzuxkOnsGU34Bj6\nYQG+gSEY1qLvwZKnA4A0cBC3FCpZxiYLfVLYm+2eXvhWACT55JWetEN9VJFznDfe\nnHlGMYebnCw5iNg9VghgVHjc8QKBgQC+I8yyjrXlWZS6pyabSYcJYxC58gDp481N\nuDZF76KqrNZpqLMolTUpZ1pz4tJxZtgG2kaJHtpMT8U7k2drz7ig2Qz/9a3yVX57\nK+fczX+CcZnrDxVY2K4xbQqh4hFmkFMr/wmek9Qw9SZt1VeAxCGb16ZeRe5MOyQr\nC6iZvod8wQKBgC4XgFK4vA33m8MFkyd9EsGyzdS5WDaR8pxX0vzTARioK9uEugIF\nUR9JVfwex2KW53zeVKlu3E7HyhPmRlDeB0pDblAWFORWEq1cx9MeZMlrESOpeH0q\nx30E0rLXEuKJXHGgaW5wcV0zndHJZ/Kqb2qE5yjFLsQdxVSu7R3iVH7BAoGBAJLb\n3dAQcCfsT/b3AdexK+6xKIsmg1Qj0j/0R18vHwoKozVKys5OqJgJLxERIY/baoGo\neBCS1vNYLbO9P4VDFIyP+P1+CdOB+0YxfE3MH29mRQcMSGWuPqUIXsz4ao44bTUv\nMIPeFGeYAg2VWZeoZXkUUHjCNLOGfoIM6DWPtuBBAoGAU7r8szn9rMsRuQ5nDO2y\nBxUleuTktiWuaSj+fQz+ju+yr4nvxA9fws/lVdetO6jzXe0gyuDrlZlB3Gt1c/BS\nOOttaoLvpUj3l5gRwAKNlsoJ0Vc4wllQ2NbgIMAAem4hIYmb7M9EealEkTfBrYae\nVo+LX8SmlGo7JJa6MCvdKFQ=\n-----END PRIVATE KEY-----\n",
//       "client_email": "firebase-adminsdk-fbsvc@estasherny-43801.iam.gserviceaccount.com",
//       "client_id": "109079682596151540713",
//       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//       "token_uri": "https://oauth2.googleapis.com/token",
//       "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//       "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40estasherny-43801.iam.gserviceaccount.com",
//       "universe_domain": "googleapis.com"
//     };
//
//     List<String> scopes = [
//       "https://www.googleapis.com/auth/userinfo.email",
//       "https://www.googleapis.com/auth/firebase.database",
//       "https://www.googleapis.com/auth/firebase.messaging"
//     ];
//     http.Client client = await auth.clientViaServiceAccount(
//       auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//       scopes,
//     );
//     auth.AccessCredentials credentials =
//         await auth.obtainAccessCredentialsViaServiceAccount(
//             auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
//             scopes,
//             client);
//     client.close();
//     return credentials.accessToken.data;
//   }
//
//   static Future<void> sendNotification(
//       String deviceToken, String title, String body, MyCallModel data) async {
//     final String accessToken = await getAccessToken();
//     log('accessToken $accessToken');
//     String endpointFCM =
//         'https://fcm.googleapis.com/v1/projects/estasherny-43801/messages:send';
//     final Map<String, dynamic> message = {
//       "message": {
//         "token": deviceToken,
//         "notification": {"title": title, "body": body},
//         "data": data.toJson()
//       }
//     };
//
//     final http.Response response = await http.post(
//       Uri.parse(endpointFCM),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $accessToken'
//       },
//       body: jsonEncode(message),
//     );
//
//     if (response.statusCode == 200) {
//       print('Notification sent successfully');
//     } else {
//       print('Failed to send notification ${response.body}');
//     }
//   }
// }
//
// /// ios permissions in info.plist
// /**
//  * <key>NSLocalNetworkUsageDescription</key>
// <string>Allow the debugger to connect over your local network.</string>
// <key>NSBonjourServices</key>
// <array>
//     <string>_dartVmService._tcp</string>
//     <string>_dartobservatory._tcp</string>
// </array>
//
//  */