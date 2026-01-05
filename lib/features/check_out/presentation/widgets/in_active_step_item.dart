import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';
class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: Colors.grey,
          child: Text('2' , style: TextStyle(
            color: Color(0xff0C0D0D), fontSize: 14,
          ),),
        ),
        SizedBox(width: 4,),
        Text(
          'shipping',
          style: AppStyles.semiBold13.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
