import 'package:flutter/material.dart';
import 'package:profile_screen/screen/home/home_page.dart';
import 'package:profile_screen/screen/profile/profile_screen.dart';

import '../setting/settings_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appname",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                print("Edit Icons Pressed");
              },
              icon: const Icon(
                Icons.edit_rounded,
                color: Colors.white,
                size: 24.0,
              ))
        ],
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          onTap: (int index) {
            setState(() {
              pageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          ]),
    );
  }

  Widget _getPage() {
    switch (pageIndex) {
      case 0:
        return const HomePage();
      case 1:
        return Container(
          alignment: Alignment.center,
          child: const Text("This is Chat"),
        );

      case 2:
        return const ProfileScreen();
      case 3:
        return Container(
          alignment: Alignment.center,
          child: SettingsPage(),
        );
      default:
        return Container(
          alignment: Alignment.center,
          child: const Text("This is home"),
        );
    }
  }
}
