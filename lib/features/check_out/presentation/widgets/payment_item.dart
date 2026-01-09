import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_style.dart';

import '../../../../core/utils/app_decoration.dart';

class PaymentItem extends StatelessWidget {

  const PaymentItem({required this.child, required this.title, super.key});
  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.bold13),
        SizedBox(height: 8),
        Container(
            padding: EdgeInsets.symmetric(vertical: 16 , horizontal: 8),

            decoration: AppDecoration.greyAppDecoration , child: child),
      ],
    );
  }
}
