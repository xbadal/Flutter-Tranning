import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            // Popping back with data
            Navigator.pop(context, "Hello");
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  print("Text button clicked");
                },
                child: const Text('Text Button')),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () {
                  print('Elevated Button Clicked');
                },
                child: const Text("Elevated Button")),
            const SizedBox(
              height: 16.0,
            ),
            OutlinedButton(
                onPressed: () {
                  print("Outline Button");
                },
                child: const Text("Outline Button")),
            const SizedBox(
              height: 16.0,
            ),
            InkWell(
              onTap: () {
                print("Using Inkwell");
              },
              child: Container(
                height: 50,
                width: 200,
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.deepPurple, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: const Text(
                  "Using Inkwell",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            GestureDetector(
              onTap: () {
                print("Using GestureDetector");
              },
              onDoubleTap: () {
                print("Double tab GestureDetector");
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.purple),
                    borderRadius: const BorderRadius.all(Radius.circular(24.0))),
                child: const Text("Using GestureDetector"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
