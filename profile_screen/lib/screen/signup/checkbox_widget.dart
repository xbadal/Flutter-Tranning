import 'package:flutter/material.dart';

import '../../style/text_style.dart';

class CheckboxWidget extends StatelessWidget {
  CheckboxWidget(
      {super.key, this.value, required this.onChange, required this.title});

  final dynamic value;
  Function(dynamic) onChange;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: (value) => onChange(value)),
        Text(
          title,
          style: robotoTextStyle(),
        ),
      ],
    );
  }
}
