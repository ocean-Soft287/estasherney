class EndPoint {
  static String baseUrl = "http://37.34.238.190:9292/TheOneAPIEstasherny";

  /// auth

  static String logindoctor = "$baseUrl/api/Doctor/login";
  static String forgetpassworddoctor = "$baseUrl/api/Doctor/forgotpassword";
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
}
