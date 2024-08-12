import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:profile_screen/screen/main/main_screen.dart';
import 'package:profile_screen/screen/signup/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void initState() {
    _checkIsLoggedIn(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Please enter your details"),
            const SizedBox(
              height: 16,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              onChanged: (String text) {
                print(text);
              },
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Email',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: passwordController,
              onChanged: (String text) {
                print(text);
              },
              obscureText: hidePassword,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: Colors.green,
                            )),
                  labelText: 'Password',
                  border: const OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              child: ElevatedButton(
                  onPressed: () => _login(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont Have an Account"),
                SizedBox(
                  width: 4.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("Sign up"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _checkIsLoggedIn(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    if (isLoggedIn == true) {
      String? userEmail = prefs.getString('userEmail');
      print('===========================================');
      print(userEmail);
      print('===========================================');
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MainScreen(
      //               email: userEmail ?? "email not found",
      //             )));
    }
  }

  _login() async {
    print("========================");
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      // print("Email: ${emailController.text}");
      // print("Password: ${passwordController.text}");
      Fluttertoast.showToast(
          msg: "Login Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);

      String email = emailController.text;
      emailController.clear();
      passwordController.clear();

      // Save data using Shared Preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(
                    email: email,
                  )));
    }
    print("========================");
  }
}
