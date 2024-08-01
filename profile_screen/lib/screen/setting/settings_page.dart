import 'package:flutter/material.dart';
import 'package:profile_screen/screen/setting/widget/setting_row_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SettingRowWidget(
            title: "Change password",
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey,
              size: 32,
            ),
          ),
          SettingRowWidget(
            title: "Change Theme",
            prefixIcon: Icon(
              Icons.color_lens,
              color: Colors.grey,
              size: 32,
            ),
          ),
          SettingRowWidget(
            title: "Other Setting",
            prefixIcon: Icon(
              Icons.settings,
              color: Colors.grey,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  _settingRow(String title) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(
            Icons.lock,
            color: Colors.grey,
            size: 32,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
