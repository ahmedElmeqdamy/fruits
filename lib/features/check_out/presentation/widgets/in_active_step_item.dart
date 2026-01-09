import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {

  const InActiveStepItem({required this.index, required this.text, super.key});
  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Colors.grey,
          child: Text(
           index,
            style: TextStyle(color: Color(0xff0C0D0D), fontSize: 14),
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.semiBold13.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
