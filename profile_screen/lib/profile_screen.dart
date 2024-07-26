import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
      body: Container(
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
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.deepPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                print('thumb_up clicked');
              },
              child: const Icon(
                Icons.thumb_up,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 32.0,),
            GestureDetector(
              onTap: (){
                print('thumb_down clicked');
              },
              child: const Icon(
                Icons.thumb_down,
                size: 24,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
