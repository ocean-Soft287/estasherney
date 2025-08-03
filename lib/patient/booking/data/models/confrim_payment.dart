class ConfrimPayment {
final String appointmentId;
final String isPaid;
ConfrimPayment({required this.appointmentId,required this.isPaid});
Map<String, dynamic> toJson() {
  return {
    'appointmentId': appointmentId,
    'isPaid': isPaid,
  };
}  




}