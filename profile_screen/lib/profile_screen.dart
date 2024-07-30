import 'package:flutter/material.dart';
import 'package:profile_screen/home_page.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
          currentIndex: pageIndex,
          onTap: (int index) {
            print('Selected Index======================== $index');

            setState(() {
              pageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            // BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          ]),
    );
  }

  Widget _getPage() {
    switch (pageIndex) {
      case 0:
        return HomePage();
      case 1:
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/user.jpeg",
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Badal Kumar",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "user_email@gmail.com",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              )
            ],
          ),
        );
      case 2:
        return Container(
          child: Text("This is Setting"),
        );
      default:
        return Container(
          child: Text("This is home"),
        );
    }
  }

  Widget _home() {
    return Container(
      child: Text("This is home"),
    );
  }
}
