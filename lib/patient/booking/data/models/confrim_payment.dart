class ConfrimPayment {
final int appointmentId;
final bool isPaid;
ConfrimPayment({required this.appointmentId,required this.isPaid});
Map<String, dynamic> toJson() {
  return {
    'appointmentId': appointmentId,
    'isPaid': isPaid,
  };
}  




}