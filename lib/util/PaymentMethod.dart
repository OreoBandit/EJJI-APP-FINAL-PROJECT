class PaymentMethod {
  int idp;
  String phone;
  String methodName;
  String ImagePath;

  PaymentMethod({
    required this.idp,
    required this.phone,
    required this.methodName,
    required this.ImagePath,
  });

  String getPaymentName() {
    return methodName;
  }
}
