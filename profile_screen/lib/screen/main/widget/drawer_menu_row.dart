import 'package:flutter/material.dart';

class DrawerMenuRow extends StatelessWidget {
  const DrawerMenuRow(
      {super.key, required this.title, required this.prefixIcon});

  final String title;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.grey,
          ))),
      child: Row(
        children: [
          prefixIcon,
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
