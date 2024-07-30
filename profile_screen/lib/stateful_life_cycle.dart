import 'package:flutter/material.dart';

class ProfileStatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<StatefulWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();

    print("================ initState ");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("================ build ");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Counter ${counter}"),
            TextButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text("Change Counter")),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print("================ deactivate ");
    super.deactivate();
  }

  @override
  void dispose() {
    print("================ dispose ");
    super.dispose();
  }
}
