// import 'package:ejjiapp/pages/paypage.dart';
import 'dart:convert';

import 'package:ejjiapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../model/cartmodel.dart';
import '../util/User.dart';
import 'package:http/http.dart' as http;

class paymentPage extends StatefulWidget {
  final User user;
  const paymentPage({Key? key, required this.user}) : super(key: key);
  @override
  State<paymentPage> createState() => _paymentPageState();
}

class _paymentPageState extends State<paymentPage> {
  Future<bool> postTransactionHeader(String totalHarga, int userID) async {
    // var url =
    // 'http://10.0.2.2:3000/transactions/TransactionHeaderPost'; //PAKE EMULATOR
    var url =
        'http://192.168.18.106:3000/transactions/TransactionHeaderPost'; //PAKE INI DI SETIAP VAR URL
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          'totalHarga': totalHarga,
          'userID': userID,
        },
      ),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> postTransactionDetail(String metode) async {
    var url = 'http://192.168.18.106:3000/transactions/TransactionDetailPost';
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {'metode': metode},
      ),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  final methods = ["OVO", "Gopay", "Shoppee Pay", "Transfer Bank", "Tunai"];
  String? methodsVal = 'OVO';
  String? harga;
  @override
  Widget build(BuildContext context) {
    String harga;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 244, 228),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 244, 228),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          // iconTheme: IconThemeData(
          //   color: Colors.grey[800],
          // ),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            harga = 'Rp.${value.calculateTotal()}'; //PASS KE DATABASE
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // my cart
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "My Cart",
                    style: GoogleFonts.notoSerif(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // list view of cart
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      itemCount: value.cartItems.length,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 238, 234, 217),
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              leading: Image.asset(
                                value.cartItems[index][2],
                                height: 36,
                              ),
                              title: Text(
                                value.cartItems[index][0],
                                style: const TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                'Rp ${value.cartItems[index][1]}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemFromCart(index),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //^LIST VIEW OF CART

                //====DESIGN BARU====
                Padding(
                  padding: const EdgeInsets.all(10),
                  // padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(196, 21, 86, 23),
                    ),
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Price',
                              style: TextStyle(
                                color: Color.fromARGB(255, 214, 240, 215),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromARGB(0, 0, 0, 0),
                                ),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 80, 0),
                                      child: Text(
                                        "Pay with",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NotoSerif',
                                          color: Colors.white,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                          canvasColor: const Color.fromARGB(
                                              255, 15, 53, 17),
                                        ),
                                        child: DropdownButton(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          style: const TextStyle(fontSize: 15),
                                          elevation: 0,
                                          iconEnabledColor: Colors.white,
                                          // isExpanded: true,
                                          items: methods.map(
                                            (String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  items,
                                                  style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 15,
                                                    fontFamily: 'NotoSerif',
                                                    // fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (String? value) {
                                            setState(
                                              () {
                                                methodsVal =
                                                    value; // <-- Will trigger re-build on StatefulWidget
                                              },
                                            );
                                          },
                                          value: methodsVal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // total price
                            Row(
                              children: [
                                Text(
                                  'Rp ${value.calculateTotal()}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      String errMSG = 'Transaction Successful!';
                                      Color errCol; //warna error
                                      if (value.calculateTotal() == '0.000') {
                                        errMSG = 'No items in cart!';
                                        errCol = Colors.red; //warna e
                                      } else if (await postTransactionHeader(
                                              harga, widget.user.id) &&
                                          await postTransactionDetail(
                                              methodsVal.toString())) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return HomePage(
                                                user: widget.user,
                                              );
                                            },
                                          ),
                                        );
                                        errCol = Colors.green;
                                      } else {
                                        //ERROR MESSAGE
                                        errMSG = "Something went wrong...";
                                        errCol = Colors.red;
                                      }
                                      final msg = SnackBar(
                                        content: Text(errMSG),
                                        backgroundColor: errCol,
                                        duration: const Duration(seconds: 2),
                                      );
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(msg);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 162, 199, 163)),
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Pay Now',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //===DESIGN BARU===
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
