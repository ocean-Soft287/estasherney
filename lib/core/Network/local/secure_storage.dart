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

  static const String specialization = "specialization";
  static const String nationalID = "nationalID";
  static const String gender = "gender";
  static const String doctorPersentage = "doctorPersentage";
  static const String yearsOfExperience = "yearsOfExperience";
  static const String doctorCertificate = "doctorCertificate";

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
      specialization,
      nationalID,
      gender,
      doctorPersentage,
      yearsOfExperience,
      doctorCertificate,
    ];

    for (var key in keys) {
      await prefs.remove(key);
    }
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> saveUserData(Map<String, dynamic> userJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, json.encode(userJson));

    await write(specialization, userJson['specialization'] ?? '');
    await write(nationalID, userJson['nationalID'] ?? '');
    await write(gender, userJson['gender'] ?? '');
    await write(doctorPersentage, userJson['doctorPersentage'].toString());
    await write(yearsOfExperience, userJson['yearsOfExperience'].toString());
    await write(doctorCertificate, userJson['doctorCertificate'] ?? '');
  }

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

 

  static Future<String?> getDoctorName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(firstName);
  }

  static Future<String?> getDoctorImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(picture);
  }

  static Future<String?> getDoctorSpecialization() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(specialization);
  }

  static Future<String?> getDoctorNationalID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(nationalID);
  }

  static Future<String?> getDoctorExamenPrice() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(examenPrice);
  }

  static Future<String?> getDoctorGender() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(gender);
  }

  static Future<String?> getDoctorPercentage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(doctorPersentage);
  }

  static Future<String?> getDoctorExperienceYears() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(yearsOfExperience);
  }

  static Future<String?> getDoctorCertificateImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(doctorCertificate);
  }
}
