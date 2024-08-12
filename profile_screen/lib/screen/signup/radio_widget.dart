import 'package:flutter/material.dart';

import '../../style/text_style.dart';

class RadioWidget extends StatelessWidget {
  RadioWidget(
      {super.key,
      this.value,
      this.groupValue,
      required this.onChange,
      required this.title});

  final dynamic value;
  final dynamic groupValue;
  Function(dynamic) onChange;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (value) => onChange(value)),
        Expanded(
          child: Text(
            title,
            style: robotoTextStyle(),
          ),
        ),
      ],
    );
  }
}
