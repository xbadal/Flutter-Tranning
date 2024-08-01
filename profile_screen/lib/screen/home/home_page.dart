import 'package:flutter/material.dart';
import 'package:profile_screen/screen/buttons/buttons_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 60,
              child: TextButton(
                onPressed: () async {
                  // Navigation from One page to Another and Passing the date
                  // Also waiting for the result from other page
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ButtonsScreen(
                                name: "Buttons Screen",
                              )));

                  print(result);
                },
                style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text(
                  "Buttons",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
