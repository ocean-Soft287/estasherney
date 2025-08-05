import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationService {
  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
  "type": "service_account",
  "project_id": "estasherny-43801",
  "private_key_id": "032164843c50c9615c625f031a3c01c7ade15c29",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCbHyMeLg20X9Rx\ncBrRBJgh1RN48DW6/cwNrCg3JkaS8BnPSt6McexXv6s2hkXjpyI6RqTg6Rea7oyP\nDWP3oNW2RrJmPvm/6Y23IVrT621JmXFand83H93R64lzFcLvcGwrrCAqVKDBsEjl\nWEcpcqQOAfr+8nsILvWePqtviGKhiFFxJeNShLermGj14628M9RMKFviJdE8BCZQ\ndzZ4YIlPStFY2Vrkzs8n33Jr+UUDSodIQQD+QtVwMQ0EIPnxqfRm8SCxP2EqHNrr\nAExKEFijjuzBoridHh82TRen1NPyjDy0a3wziQqtmhNgGHbqodk98NIjRzICoJT/\n08YVLbZJAgMBAAECggEAQG5zAkajx5+kWMf1Q4tye18LWwj/cF+Z4bX38ExUNRVI\nyyrwfIqXXi1NOvUT04bo9ya/tnHrLZ3XQVYRB1rFWhRMZp7S0w16IS5YET0xJEh5\nZme7vyRb2SVJ7sUDtrvOGmfA5oRHT5xe8vAzgrpM/UqCTGJAizoiKGwkfku6mBgm\nWhFw3bJ6DJcrKmzAqSj4PS0F5SiZZTlmBjADxEl9sCuo8DwjQmJ6kiefzHqsaz+n\nlkfWfgy+xeextShtA5hWef1YbbVYjh2oug6Rse0WiQ0iqDjzFcffltMAk/HLNS7Y\nhTUC5FA21wJEnhh5p8FD0lpR+5nTOrDEJ7atxmIXFwKBgQDbSIPbyuFyT2aqt5ax\nojoN71x44ZAflUdP1y4zpJrLQyW3voaKbdwuJ+BPBlRVTwga6Xlx/WYQBn9fWqCH\nXUamvmTweZXIrawvcoepl59wREyR2xRtlFiFjQ67N/U6VNyGVQO8hP+0azrNHMPo\nyoV1Moi0C4wD3GO9cyIkB9v8kwKBgQC1GFxVpBLAlGqCjZ4cRRHepKI3KPGIDFgP\nAwVKd3KbusGuXIzo3SzhN1lD3oXqyB2zca7VAWymUOeQaoFtwBTyH3n5EebJguAY\nA2rdf2atGGVdjdDIlanK+IpBRLVxl2KNejnjOiNYdTExKmmjJ/M9zjFNHqsuLqBZ\nxYQzZ6AnMwKBgQCXsRpGOZqrkPHctxOv3iF68lJt7NvefU3PlXOIlh3e7pxw94Pq\nzwS5iSxKfn5oZTueIlS43ip0e4oxVGgoPAZb4unA0Nsk779lMz1VvGW3LAgr/fmr\ntCtod6PxL0ydBYdoBfeHuhmJnYQX0AZWS4L3B/Y5VqONKDB3JeZANo+fsQKBgEyu\n1xJwmnwvnHZRz1y7Jpj3b7UZwkTQrU0WA1yH/eDRkQfrKsPEPCfVzxe9F0nWmTUN\n83FA3CgE5Dkz0ECP8I6iI30DRo2XvJqOf+bw9qJfTTTzQzBcp3xKCAkhNg+2gcXU\ntsRwLt1bKoxeIEM1PHu0Xw3/6Y5xsfaxe4xk2d0fAoGBAJ1Xon0it+VBc8Utu078\n+m+SyGguGnyZ1OC8gpqHxlEsrYg0SILPPu7HL6FLL5HycLpw0acyiSN4i6+tIh6I\nehKT+OjS+Xd1K3xsEIPJzhzX2w69C7KTA3uqNPxr0eQ8CokS/rXPqrwO11UQLjeU\nLV2/htGZcgnCpWEVJIfQIsfm\n-----END PRIVATE KEY-----\n",
  "client_email": "estashernry@estasherny-43801.iam.gserviceaccount.com",
  "client_id": "110582604010381539215",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/estashernry%40estasherny-43801.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
};
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);
    client.close();
    return credentials.accessToken.data;
  }

  static Future<void> sendNotification(
      String deviceToken, String title, String body) async {
    final String accessToken = await getAccessToken();
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