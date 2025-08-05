import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationService {
  static Future<String> getAccessToken() async {
    final serviceAccountJson = 
{
  "type": "service_account",
  "project_id": "estasherny-43801",
  "private_key_id": "fc2c0cc48b52e22a3e14b94cade969df80dc40b3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCyLVqHJ1uQsiG1\nI9dh27/SKErsCL3ZTPpStw8h4eYBRX1ujTyrCRL1SmTrDyCFlNMzH+efLpiJgc9c\nYY/frwvtkbKGtWhhWBCXpJTtoDUvq8agH0JWkIFGFsKFPYuA6Bu7vRkcJNLivBI3\nXH57WMz9ThNNmb9Z1WrBKw+jUhCbUIpWHtO9QmxvGgMY6L0ZqKvRnh1tWjhmhcWA\n0nGNkGMqYmUys5YMOBgRTFY95CQo9+0sD2e+63u15QNpjZq3iVRiDLdwHt1QahOt\n/+lzJL7NmxupubGhkojxUq+URr0yM37+TNApR/6xAdbaqPiKt4J8oFM/4H1OYAXZ\npXYs2fydAgMBAAECggEAIwMCfPhg58f5E60dT59szBEa19LH64FS1xodoRzQo4NS\nKH0cZMd9sDGULxRj4Zvi/HLSgtcXJj4Zzx9ktCGjiGVO3WWcQzSY3hN7KE6I5Psu\nJpy93mC65ljmlGQJm6UAfh2kZ4Fc5yzpr3M/b2F9tnC3HlKN5UsolRivE/q2RK50\nucaS+kmAX9f9ZJ6Ez8dyAhEl6kHl7HSV3NmBJsEL0/4RK565DlND4VsqEXy8GS24\nEV1UbUIVvjSzkfzE9Zc1WMkR288AGajsUtakuAZ7vjpBisgkterBTblDQ4UTSMlS\nGZ5N12wlIAMftAV9OhG9irecHY2pw1dKS0e6bhvtyQKBgQDldM3OuY2i+G4Xz7H+\nliW8JgmRitksUVLQGUNh2c/wZ2ndfJD8ozFZhmWSktWDv40iuEN7YA2GimNmcMym\nTBE+Wj72suAVBUzvpFi7iKv0lb7SpcWXjZU0yVW+1kaDqEcTTw2YMp/s6kvjN/k2\nkAy5sykwkzakedw9Y1yQ3BZjMwKBgQDGyfPuiMQKcNHnI5rTYW8Z8UCocVFLaOsw\niRZRLZDEZ0B37xIBwOJxAK7MAR3cr6w1D558AOjKqcScAPoRWzRwhOm6whQfyXu5\niBA6YvQffAFYECAp3Fbg7cV/navNmWrAyYTOLHLxNiWOqvjjGytys9B0Wn0X59sZ\nKK1eij8g7wKBgQDd5pa+C/4olB5MEsTtEyGNEjAAu4mI7WCr9TKP58fLkwbzdmr0\nl5G7JVkHZc7s6YtA/3frUZni+eRlBkMzs66dYUMw6w3/5i9gNczGF8dL8qEnL7+l\n7/tSoD63Hpv06QFLcBESlirJQFCBffkZxjc4Q0ZbPpMCfwL5rySuxtkztwKBgQCp\n4dbT6A9ZONc5J8VdlevDiNgP2191CYHMparrzvvjzLVciXOjCfq6RbIb52xkt8B8\nTA/Nu102LOU3yOHsSTxEWGICV2+pRp+0i2IK85va+DeR0Z4bCBE7AhgBGnbDKrP/\nc3hKVdQY7YQlK1mtg/+ac67WcKps7pjgJFIc9BpFAwKBgQDBewY7HaTaxlxFhs35\nfhtAa4nMmg+1GidnHKhg9tVUjBTsw4dioWq8SS8hHwFsC7xt+h5dBxjwt7xFtHDa\nsTUToE0xIAyy3a6VDGmUy3QTKEFP9DfJ8Cb9FLWAI3NXRDBMJ72t7+HkNGgRNXgD\nH9BhREN21cQwDeYg1V1ZHPYQPA==\n-----END PRIVATE KEY-----\n",
  "client_email": "ownerest@estasherny-43801.iam.gserviceaccount.com",
  "client_id": "104964778386686279867",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ownerest%40estasherny-43801.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

;

  
  
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
    log ('accessToken $accessToken');
    String endpointFCM =
        'https://fcm.googleapis.com/v1/projects/estasherny-43801/messages:send';
    final Map<String, dynamic> message = {
      "message": {
        "token": deviceToken,
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
      print('Failed to send notification ${response.body}');
    }
  }
}
/// ios permissions in info.plist
/**
 * <key>NSLocalNetworkUsageDescription</key>
<string>Allow the debugger to connect over your local network.</string>
<key>NSBonjourServices</key>
<array>
    <string>_dartVmService._tcp</string>
    <string>_dartobservatory._tcp</string>
</array>

 * 
 */