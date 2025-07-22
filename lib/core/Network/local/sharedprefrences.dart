import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  // Ensure it's initialized only once
  static Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (_sharedPreferences == null) {
      throw Exception("CacheHelper not initialized. Call init() first.");
    }

    if (value is String) {
      return await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      return await _sharedPreferences!.setDouble(key, value);
    } else {
      throw Exception("Invalid value type");
    }
  }

  static dynamic getData({required String key}) {
    if (_sharedPreferences == null) {
      throw Exception("CacheHelper not initialized. Call init() first.");
    }

    return _sharedPreferences!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    if (_sharedPreferences == null) {
      throw Exception("CacheHelper not initialized. Call init() first.");
    }

    return await _sharedPreferences!.remove(key);
  }

  static Future<bool> clearData() async {
    if (_sharedPreferences == null) {
      throw Exception("CacheHelper not initialized. Call init() first.");
    }

    return await _sharedPreferences!.clear();
  }
}
