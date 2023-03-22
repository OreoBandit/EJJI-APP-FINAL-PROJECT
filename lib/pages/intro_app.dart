import 'package:ejjiapp/pages/loginpage.dart';
import 'package:ejjiapp/pages/signup.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 228),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // big logo
                Padding(
                  padding: const EdgeInsets.only(
                    left: 100.0,
                    right: 100.0,
                    top: 120,
                    bottom: 20,
                  ),
                  child: Image.asset('lib/gambar/logo2.png'),
                ),

                // we deliver groceries at your doorstep
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    'Making Mornings Better',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // groceree gives you fresh vegetables and fruits
                Text(
                  'with our fresh coffee',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),

                const SizedBox(height: 20),

                const SizedBox(height: 20),

                //LOGIN BUTTON
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(214, 182, 140, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                //SIGN UP BUTTON
                SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUp();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Color.fromARGB(214, 182, 140, 1),
                      ),
                      primary: const Color.fromARGB(255, 248, 244, 228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color.fromARGB(214, 182, 140, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
