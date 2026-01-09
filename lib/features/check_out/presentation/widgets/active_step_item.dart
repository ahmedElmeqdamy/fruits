import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white, size: 18),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.bold13.copyWith(color: Colors.blueAccent),
        ),
      ],
    );
  }
}
