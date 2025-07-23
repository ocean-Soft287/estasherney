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

  
  static const String idpationt = "id";
  static const String emailpationt = "email";
  static const String passwordpationt = "password";
  static const String fullNamepationt = "fullName";
  static const String fulNamepationt = "fullName"; 
  static const String phoneNumber = "phoneNumber";
  static const String birthday = "birthday";
  static const String imageurlpationt = "imageUrl";
  static const String tokenpationt = "token";

  
  static const String favoritesKey = "favorites";

  
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
      token, email, password, firstName, lastName, picture, userKey, examenPrice,
      specialization, nationalID, gender, doctorPersentage, yearsOfExperience,
      doctorCertificate, idpationt, fulNamepationt, phoneNumber, birthday,
      imageurlpationt, tokenpationt, emailpationt, passwordpationt, fullNamepationt
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
    try {
      await prefs.setString(userKey, json.encode(userJson));

      await write(specialization, userJson['specialization'] ?? '');
      await write(nationalID, userJson['nationalID'] ?? '');
      await write(gender, userJson['gender'] ?? '');
      await write(doctorPersentage, '${userJson['doctorPersentage'] ?? ''}');
      await write(yearsOfExperience, '${userJson['yearsOfExperience'] ?? ''}');
      await write(doctorCertificate, userJson['doctorCertificate'] ?? '');
      await write(examenPrice, '${userJson['examenPrice'] ?? ''}');
      await write(firstName, userJson['firstName'] ?? '');
      await write(lastName, userJson['lastName'] ?? '');
      await write(picture, userJson['picture'] ?? '');
      await write(idpationt, '${userJson['id'] ?? ''}');
      await write(emailpationt, userJson['email'] ?? '');  
      await write(passwordpationt, userJson['password'] ?? '');
      await write(fullNamepationt, userJson['fullName'] ?? '');
      await write(phoneNumber, userJson['phoneNumber'] ?? '');
      await write(birthday, userJson['birthday'] ?? '');
      await write(imageurlpationt, userJson['imageUrl'] ?? ''); 
    } catch (e) {
      print(' Error saving user data: $e');
    }
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(userKey);
    if (userString != null) {
      try {
        return json.decode(userString);
      } catch (e) {
        print(' Error decoding user data: $e');
      }
    }
    return null;
  }

  
  static Future<String?> getDoctorName() async => read(firstName);
  static Future<String?> getDoctorImage() async => read(picture);
  static Future<String?> getDoctorSpecialization() async => read(specialization);
  static Future<String?> getDoctorNationalID() async => read(nationalID);
  static Future<String?> getDoctorExamenPrice() async => read(examenPrice);
  static Future<String?> getDoctorGender() async => read(gender);
  static Future<String?> getDoctorPercentage() async => read(doctorPersentage);
  static Future<String?> getDoctorExperienceYears() async => read(yearsOfExperience);
  static Future<String?> getDoctorCertificateImage() async => read(doctorCertificate);
  static Future<String?> getPatientId() async => read(idpationt);
  static Future<String?> getPatientEmail() async => read(emailpationt);
  static Future<String?> getPatientPassword() async => read(passwordpationt);
  static Future<String?> getPatientFullName() async => read(fullNamepationt);
  static Future<String?> getPatientPhoneNumber() async => read(phoneNumber);
  static Future<String?> getPatientBirthday() async => read(birthday);
  static Future<String?> getPatientImage() async => read(imageurlpationt);

 
  static Future<void> addToFavorites(Map<String, dynamic> item) async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(favoritesKey);
    List<Map<String, dynamic>> favList = [];
    if (existing != null) {
      favList = List<Map<String, dynamic>>.from(json.decode(existing));
    }
    favList.add(item);
    await prefs.setString(favoritesKey, json.encode(favList));
  }

  static Future<List<Map<String, dynamic>>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favString = prefs.getString(favoritesKey);
    if (favString != null) {
      try {
        return List<Map<String, dynamic>>.from(json.decode(favString));
      } catch (e) {
        print(' Error decoding favorites: $e');
      }
    }
    return [];
  }

  static Future<void> removeFromFavorites(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favString = prefs.getString(favoritesKey);
    if (favString != null) {
      try {
        List<Map<String, dynamic>> favList =
            List<Map<String, dynamic>>.from(json.decode(favString));
        favList.removeWhere((item) => item['id'].toString() == id);
        await prefs.setString(favoritesKey, json.encode(favList));
      } catch (e) {
        print(' Error removing from favorites: $e');
      }
    }
  }

  static Future<bool> isFavorite(String id) async {
    final favs = await getFavorites();
    return favs.any((item) => item['id'].toString() == id);
  }
}
