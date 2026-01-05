import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_style.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Colors.green,
          child: Icon(Icons.check, color: Colors.white, size: 18,),
        ),
        SizedBox(width: 4,),
        Text(
          'shipping',
          style: AppStyles.bold13.copyWith(color: Colors.blueAccent),
        ),
      ],
    );
  }
}
