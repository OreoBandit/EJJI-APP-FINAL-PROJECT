import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List shopItems_ = const [
    // [ itemName, itemPrice, imagePath, color ]
    [
      "Biscoff Chokoretto",
      "27.000",
      "lib/gambar/Biscoff-Chokoretto.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Biscoff Coffee Latte",
      "26.000",
      "lib/gambar/Biscoff-Coffee.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Coffee Latte",
      "15.000",
      "lib/gambar/Coffee-Latte.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Matcha Latte",
      "20.000",
      "lib/gambar/Matcha.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Miruku Boba",
      "20.000",
      "lib/gambar/Miruku-Boba.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Miruku Tea Boba",
      "22.000",
      "lib/gambar/Miruku-Tea-Boba.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Oishii Berrycoff",
      "28.000",
      "lib/gambar/Oishii-Berrycoff.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Oishii Berrymon",
      "22.000",
      "lib/gambar/Oishii-Berrymon.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Pinku Latte Boba",
      "22.000",
      "lib/gambar/Pinku-Boba.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
    [
      "Pinku Lemonade",
      "18.000",
      "lib/gambar/Pinku-Lemonade-Squash.png",
      Color.fromARGB(255, 197, 162, 149)
    ],
  ];

  // list of cart items
  List cartItems_ = [];

  get cartItems => cartItems_;

  get shopItems => shopItems_;

  // add item to cart
  void addItemToCart(int index) {
    cartItems_.add(shopItems_[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    cartItems_.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(3);
  }
}
