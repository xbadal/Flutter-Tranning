import 'package:flutter/material.dart';
import 'package:profile_screen/screen/buttons/buttons_screen.dart';
import 'package:profile_screen/screen/tab_bar/tab_bar_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: TextButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return _alertDialog(context);
                      });
                },
                style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text(
                  "Alert Dialog",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: TextButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _alertCustomDialog(context);
                      });
                },
                style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text(
                  "Custom Alert Dialog",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: TextButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  TabBarScreen()));
                },
                style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text(
                  "Tab bar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

_alertCustomDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    backgroundColor: Colors.white,
    elevation: 2.0,
    child: Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Showing custom Alert dialog",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
              "Hi You have just seen the Custom Alert dialog demo, click cancel botton to close."),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Okay",
                    style: TextStyle(color: Colors.pink),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"))
            ],
          )
        ],
      ),
    ),
  );
}

// Showing Alert Dialog
_alertDialog(BuildContext context) {
  return AlertDialog(
    title: const Text("Alert Dialog Demo"),
    content: const Text(
        "Hi You have just seen the Alert dialog demo, click cancel botton to close."),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Okay",
            style: TextStyle(color: Colors.pink),
          )),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"))
    ],
  );
}
