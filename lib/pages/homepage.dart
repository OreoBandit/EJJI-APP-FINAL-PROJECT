import 'package:ejjiapp/pages/paymentpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/groceryitem.dart';
import '../model/cartmodel.dart';
import '../util/User.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getGreeting() {
    var dateTime = DateTime.now();
    if (dateTime.hour < 11) {
      return "Good Morning!";
    } else if (dateTime.hour < 15) {
      return "Good Afternoon!";
    } else if (dateTime.hour < 18) {
      return "Good Evening!";
    } else {
      return "Good Evening!";
    }
  }

  String getOrder() {
    var time = DateTime.now();
    if (time.hour < 10) {
      return "Let's order something that wakes you up";
    } else if (time.hour < 15) {
      return "Let's order something that refreshing!";
    } else {
      return "Let's order based on your mood";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 244, 228),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(
              size: 35,
              Icons.location_on,
              color: Colors.grey[700],
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pickup at',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ejji Coffe Corner District 26, Bogor, Indonesia',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 9, 24.0, 0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:
              const Color.fromARGB(226, 141, 108, 10).withOpacity(0.9),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return paymentPage(user: widget.user);
              },
            ),
          ),
          child: const Icon(Icons.shopping_bag),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 26),

            // good morning bro
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(getGreeting()),
            ),

            const SizedBox(height: 4),

            // Let's order something that wakes you up
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                getOrder(),
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 13),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(height: 5),

            // recent orders -> show last 3
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () =>
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
