import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String token = "token";
  static const String email = "email";
  static const String password = "password";
  static const String firstName = "firstName";
  static const String lastName = "lastName";
  static const String picture = "picture";
  static const String userKey = "user";
  static const String examenPrice = "examenPrice";

  static Future<void> write(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<bool> containsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<void> clearSavedKeys() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> keys = [
      token,
      email,
      password,
      firstName,
      lastName,
      picture,
      userKey,
      examenPrice,
    ];

    for (var key in keys) {
      await prefs.remove(key);
    }
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // تخزين بيانات المستخدم
  static Future<void> saveUserData(Map<String, dynamic> userJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, json.encode(userJson));
  }

  // قراءة بيانات المستخدم
  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(userKey);
    if (userString != null) {
      try {
        return json.decode(userString);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}
