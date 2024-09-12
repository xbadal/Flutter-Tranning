import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 0;

  @override
  void initState() {
    super.initState();
  }

  Stream<int?> startCounting() async* {
    for (int i = 0; i <= 1000; i++) {
      await Future.delayed(Duration(seconds: 1));

      if (i == 5) {
        throw "we can not have 5 here";
      } else if (i == 3) {
        yield null;
      } else {
        yield i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hello world"),
              SizedBox(
                height: 16,
              ),
              StreamBuilder(
                  stream: startCounting(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                    if (snapshot.hasData) {
                      return Text(
                        'Value : ${snapshot.data}',
                        style: TextStyle(fontSize: 32),
                      );
                    }

                    return const Text(
                      'No Data',
                      style: TextStyle(fontSize: 32),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
