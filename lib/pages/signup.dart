import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController password_controller_confirm = TextEditingController();

  Future<bool> usrDupli(String username) async {
    var url = 'http://192.168.18.106:3000/users/RegisterCheckUsername';
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'username': username,
        }));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> emailDupli(String email) async {
    var url = 'http://192.168.18.106:3000/users/RegisterCheckEmail';
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email}));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> registerUser(
      String username, String u_password, String email) async {
    var url = 'http://192.168.18.106:3000/users/registerUser';
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          'username': username,
          'u_password': u_password,
          'email': email,
        },
      ),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
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

                  // welcome
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Ohayou!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'NotoSerif'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Welcome to Ejji Coffe Corner',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontFamily: 'NotoSerif'),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 234, 217),
                          border: Border.all(
                              color: const Color.fromARGB(255, 223, 219, 202)),
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
                  // username textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 234, 217),
                          border: Border.all(
                              color: const Color.fromARGB(255, 223, 219, 202)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: username_controller,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Username'),
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
                          color: const Color.fromARGB(255, 238, 234, 217),
                          border: Border.all(
                              color: const Color.fromARGB(255, 223, 219, 202)),
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

                  const SizedBox(height: 10),
                  //confirm password textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 238, 234, 217),
                          border: Border.all(
                              color: const Color.fromARGB(255, 223, 219, 202)),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: password_controller_confirm,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),

                  // Sign up button
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        String errMSG = "Successfuly registered!";
                        Color errCol;
                        if (username_controller.text.isEmpty ||
                            password_controller.text.isEmpty ||
                            email_controller.text.isEmpty ||
                            password_controller_confirm.text.isEmpty) {
                          errMSG = "Please fill all of the forms";
                          errCol = Colors.red;
                        } else if (username_controller.text.length < 4) {
                          errMSG = "username must be at least 4 characters";
                          errCol = Colors.red;
                        } else if (!EmailValidator.validate(
                            email_controller.text, true)) {
                          errMSG = "email format is incorrect";
                          errCol = Colors.red;
                        } else if (password_controller.text.length < 8) {
                          errMSG = "password must be at least 8 characters";
                          errCol = Colors.red;
                        } else if (!(password_controller.text ==
                            password_controller_confirm.text)) {
                          errMSG = "password did not match";
                          errCol = Colors.red;
                        } else {
                          if (await usrDupli(username_controller.text)) {
                            //USERNAME ALREADY EXIST
                            errMSG = "Username Already Exist";
                            errCol = Colors.red;
                          } else if (await emailDupli(email_controller.text)) {
                            //EMAIL ALREADY EXIST
                            errMSG = "Email already registered";
                            errCol = Colors.red;
                          } else {
                            if (await registerUser(
                                username_controller.text,
                                password_controller.text,
                                email_controller.text)) {
                              Navigator.of(context).pop(context);
                              errCol = const Color.fromARGB(255, 130, 234, 134);
                            }
                            errCol = const Color.fromARGB(255, 130, 234, 134);
                          }
                        }
                        final msg = SnackBar(
                          content: Text(errMSG),
                          backgroundColor: errCol,
                          duration: const Duration(seconds: 2),
                        );
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
                            "Sign up",
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
                ],
              ),
            ),
          ),
        ));
  }
}
