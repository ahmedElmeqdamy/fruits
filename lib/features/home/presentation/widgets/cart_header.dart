import 'package:flutter/material.dart';
class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,

      padding:  EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xffEBF9F1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: Text('you have 3 itmes in Cart')),
    );
  }
}
