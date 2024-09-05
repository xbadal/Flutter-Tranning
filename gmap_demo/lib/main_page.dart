import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int data = 0;

  @override
  Widget build(BuildContext context) {

    print("Build ");
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$data'),
            IconButton(
                onPressed: () {
                  onPress();
                },
                icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }


  onPress(){
    data = data + 1;
    print(data);

    // It build
  }


}

