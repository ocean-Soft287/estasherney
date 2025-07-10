class EndPoint {
  static String baseUrl = "http://37.34.238.190:9292/TheOneAPIEstasherny";

  /// auth

  static String logindoctor = "$baseUrl/api/Doctor/login";
  //appointment
  static String getTodayAppointments = "$baseUrl/api/Doctor/getDoctorAppointmentsToday";
 
}