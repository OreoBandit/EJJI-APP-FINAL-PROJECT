import 'package:flutter/material.dart';

class PaymentItemTile extends StatelessWidget {
  final String paymentName;
  final String imagePath;
  void Function()? onPressed;

  PaymentItemTile({
    super.key,
    required this.paymentName,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // payment image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Image.asset(
                  imagePath,
                  height: 64,
                ),
              ),

              // payment name
              Text(
                paymentName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              MaterialButton(
                onPressed: onPressed,
                color: Colors.white,
                child: Text(
                  'paymentName',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
