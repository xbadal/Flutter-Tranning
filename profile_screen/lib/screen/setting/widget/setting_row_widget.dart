import 'package:flutter/material.dart';

class SettingRowWidget extends StatelessWidget {
  const SettingRowWidget({super.key, required this.title, required this.prefixIcon});

  final String title;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          prefixIcon,
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600),
          )),
          const Icon(
            Icons.navigate_next,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
