import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:profile_screen/screen/login/login_screen.dart';
import 'package:profile_screen/screen/main/main_screen.dart';
import 'package:profile_screen/screen/splash/splash_screen.dart';
import 'package:profile_screen/stateful_life_cycle.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/splash': (BuildContext context) => const SplashScreen(),
      },
      // initialRoute: '/splash',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
