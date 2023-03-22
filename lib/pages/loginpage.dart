import 'package:ejjiapp/pages/homepage.dart';
import 'package:ejjiapp/pages/signup.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'homepage.dart';
import '../util/User.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  Future<User> loginUser(String email, String u_password) async {
    var url = 'http://192.168.18.106:3000/users/login'; //mobile device
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'u_password': u_password}));
    var result = jsonDecode(response.body);
    if (result.length > 0) {
      return User.fromJson(result[0]);
    } else {
      return User(
        id: -1,
        email: 'none',
        username: 'none',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 244, 228),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 90.0,
                      right: 90.0,
                      top: 0,
                      bottom: 20,
                    ),
                    child: Image.asset('lib/gambar/ejji.png'),
                  ),

                  // hello again!
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'NotoSerif'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Where have you been? We missed you',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontFamily: 'NotoSerif'),
                    ),
                  ),
                  SizedBox(height: 30),

                  // email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: email_controller,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Email'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: password_controller,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Password'),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 45),

                  // log in button

                  SizedBox(
                    height: 60,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        String errMSG = 'Login Succesful';
                        Color errCol;
                        if (email_controller.text.isEmpty ||
                            password_controller.text.isEmpty) {
                          errMSG = "Please fill all of the forms";
                          errCol = Colors.red;
                        } else {
                          User usera = await loginUser(
                              email_controller.text, password_controller.text);
                          //API LOGIN
                          if (usera.id > 0) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage(
                                    user: usera,
                                  );
                                },
                              ),
                            );
                            errCol = Colors.green;
                          } else {
                            //ERROR MESSAGE
                            errMSG = "Incorrect email or password!";
                            errCol = Colors.red;
                          }
                        }
                        final msg = SnackBar(
                          content: Text(errMSG),
                          backgroundColor: errCol,
                          duration: const Duration(seconds: 2),
                        );
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(msg);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[200],
                        // shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              color: Color.fromARGB(178, 104, 80, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
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
                        child: Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
