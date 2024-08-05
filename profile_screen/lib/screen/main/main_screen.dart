import 'package:flutter/material.dart';
import 'package:profile_screen/screen/chat/chat_screen.dart';
import 'package:profile_screen/screen/home/home_page.dart';
import 'package:profile_screen/screen/main/widget/drawer_menu_row.dart';
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
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 200,
              color: Colors.pink,
            ),
            const DrawerMenuRow(
              title: 'Home',
              prefixIcon: Icon(Icons.home),
            ),
            const DrawerMenuRow(
              title: 'Profile',
              prefixIcon: Icon(Icons.person),
            ),
            const DrawerMenuRow(
              title: 'Settings',
              prefixIcon: Icon(Icons.settings),
            ),
            const DrawerMenuRow(
              title: 'Logout',
              prefixIcon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ]),
    );
  }

  Widget _getPage() {
    switch (pageIndex) {
      case 0:
        return const HomePage();
      case 1:
        return ChatScreen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const SettingsPage();
      default:
        return Container(
          alignment: Alignment.center,
          child: const Text("This is home"),
        );
    }
  }
}
