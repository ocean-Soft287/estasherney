import 'package:flutter_dotenv/flutter_dotenv.dart';
class EndPoint {
  static String baseUrl = "http://37.34.238.190:9292/TheOneAPIEstasherny";
  static String paymanet=  dotenv.env ['paymanet']??""; 

  /// auth
  static String logindoctor = "$baseUrl/api/Doctor/login";
  static String forgetpassworddoctor = "$baseUrl/api/Doctor/forgotpassword";
  /// token 
  
  static String getPatientDeviceToken({required String id}) =>   '$baseUrl/api/Patient/getPatientDeviceToken?id=$id';
  static String updatePatientDeviceToken =    '$baseUrl/api/Patient/updateDeviceToken';
  static Map<String,dynamic> updatePatientDeviceTokenbody({required String patientId,required String deviceToken}) =>   {
  "patientId": patientId,
  "deviceToken": deviceToken
};

 /// Call
  
 static String startCall =   '$baseUrl/api/Call/start';
 static String endCall ({required String id}) =>   '$baseUrl/api/Call/end/$id';
 static String getmyCalls =   '$baseUrl/api/Call/myCalls';



  //appointment
  static String getTodayAppointments =
      "$baseUrl/api/Doctor/getDoctorAppointmentsToday";
  static String resetpassworddoctor = "$baseUrl/api/Doctor/resetpassword";
  static String getDoctorFutureAppointments =
      "$baseUrl/api/Doctor/getDoctorFutureAppointments";
  static String getDoctorPastAppointments =
      "$baseUrl/api/Doctor/getDoctorPastAppointments";
  static String searchPatient =
      "$baseUrl/api/Doctor/searchAppointmentsByPatientName";
  static String getDoctoravaibilty = "$baseUrl/api/Doctor/addAvailability";

  static String doctorprice = "$baseUrl/api/Doctor/doctorMoneyByPercentage";
  static String registerpation = "$baseUrl/api/Patient/register";
  static String verifyOtp = "$baseUrl/api/Patient/verify-otp";
  static String loginPatient = "$baseUrl/api/Patient/login";
  static String forgetpasswordpation = "$baseUrl/api/Patient/forgotpassword";
  static String resetPasswordpationt = "$baseUrl/api/Patient/resetpassword";
  static String getAllSpecialistspationt =
      "$baseUrl/api/Patient/getAllSpecialities";
  static String getAllDoctorsBySpecialty =
      "$baseUrl/api/Patient/getDoctorsBySpecialty";
      static String setFavoriteDoctors ="$baseUrl/api/Patient/setFavoriteDoctors";
      static  String getFavoriteDoctors ="$baseUrl/api/Patient/getFavoriteDoctors";
      static String removeFavoriteDoctor ="$baseUrl/api/Patient/removeFavoriteDoctor";
      static String deleteAccount = "$baseUrl/api/Patient/deleteAccount";
      static String updateProfile = "$baseUrl/api/Patient/updateProfile";
      static String getProfile = "$baseUrl/api/Patient/profile";
      static String addAppointment = "$baseUrl/api/Patient/addAppointment";
      static String confirmAppointment = "$baseUrl/api/Patient/confirmPayment";

     static String getDoctorAvailabilitiesByIdAndDay 
     ({required String doctorId,required String date })=> '/api/Patient/getDoctorAvailabilitiesByIdAndDay/$doctorId?date=$date';

 static String getDoctorRatingsummary(int doctorId) =>
    "$baseUrl/api/Patient/getDoctorRatingSummary/$doctorId";
    static String postDoctorRating(int doctorId) =>
    "$baseUrl/api/Patient/rateDoctor/$doctorId";
  static String getAllRatings(int doctorId) =>
      "$baseUrl/api/Patient/getDoctorRating/$doctorId";
      static String getallPationtAppointment="$baseUrl/api/Patient/getPatientAppointments";




}
