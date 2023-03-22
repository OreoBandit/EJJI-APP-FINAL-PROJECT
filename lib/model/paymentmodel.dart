import 'package:flutter/material.dart';

class PaymentModel extends ChangeNotifier {
  // list payment method
  final List paymentMethod_ = [
    // name, image path
    ["Cash", "lib/pay/cash.png"],
    ["Card", "lib/pay/atm-card.png"],
    ["OVO", "lib/pay/ovo.png"],
    ["Gopay", "lib/pay/gopay.png"],
    ["ShoppePay", "lib/pay/shoppepay.png"],
  ];

  List payMethod_ = [];
  // cartItems
  get payMethod => payMethod_;
  // shopItems
  get paymentMethod => paymentMethod_;
}
