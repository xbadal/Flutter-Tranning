import 'package:flutter/material.dart';
import 'package:profile_screen/screen/tab_bar/pages/tab_rated.dart';

class TabBarScreen extends StatefulWidget {
  TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with TickerProviderStateMixin {
  List tabs = ["Top Rated", "Top Bollywood", "Top South"];

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      print("addListener");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Tab bar view'),
        bottom: TabBar(controller: controller, tabs: [
          Tab(
            text: "Online",
          ),
          Tab(
            text: "Friends",
          ),
          Tab(
            text: "Matches",
          ),
        ]),
      ),
      body: TabBarView(
          controller: controller,
          children: [TabRated(), Container(), Container()]),
    );
  }
}
