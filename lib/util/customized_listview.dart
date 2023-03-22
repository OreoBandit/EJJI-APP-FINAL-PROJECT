import 'package:ejjiapp/util/PaymentMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/PaymentMethod.dart';
import '../util/User.dart';

class customizedListView extends StatefulWidget {
  final PaymentMethod paymentMethod;

  const customizedListView({Key? key, required this.paymentMethod})
      : super(key: key);

  @override
  State<customizedListView> createState() => _customizedListViewState();
}

class _customizedListViewState extends State<customizedListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          // Navigator.popUntil(context, (route) => true);
          //       // return FishDetail(user: widget.user, item: widget.fishItem);
          //     },
          //   ),
          // );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          primary: const Color.fromARGB(255, 238, 234, 217),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            //untuk gambar
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  widget.paymentMethod.ImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //untuk data
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NAMA METODE
                    Text(
                      widget.paymentMethod.methodName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'NotoSerif',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
