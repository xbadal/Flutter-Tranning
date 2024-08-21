import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:profile_screen/screen/main/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  RxBool hidePassword = true.obs;


  int count = 0;



  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }


  togglePassword() {
    hidePassword.value = !hidePassword.value;
  }



  // Check if user already logged in
  checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    if (isLoggedIn == true) {
      String? userEmail = prefs.getString('userEmail');
      Get.to(MainScreen(email: userEmail ?? 'N/A'));
    }
  }

  login() async {
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

      String email = emailController.text;
      emailController.clear();
      passwordController.clear();

      // Save data using Shared Preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);

      // print("Email: ${emailController.text}");
      // print("Password: ${passwordController.text}");
      Fluttertoast.showToast(
          msg: "Login Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);




//
      Get.to(MainScreen(
        email: email,
      ));

      print("========================");
    }
  }
}
