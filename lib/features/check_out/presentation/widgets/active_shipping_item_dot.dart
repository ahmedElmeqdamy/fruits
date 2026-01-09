import 'package:flutter/material.dart';

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xff949d9e))),
      ),
      child: Container(
        width: 18,
        height: 18,
        decoration: ShapeDecoration(
          shape: OvalBorder(),
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
