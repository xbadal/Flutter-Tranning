import 'package:flutter/material.dart';
import 'package:profile_screen/screen/main/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 16,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  _checkIsLoggedIn() async {
    // Implementation of Shared Preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    await Future.delayed(const Duration(seconds: 2));
    if (isLoggedIn == true) {
      String? userEmail = prefs.getString('userEmail');
      // Navigating without context using Global Key
      navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
          builder: (context) => MainScreen(email: userEmail!)));
    } else {
      // Using Name routes
      navigatorKey.currentState!.pushReplacementNamed('/login');
    }
  }
}
