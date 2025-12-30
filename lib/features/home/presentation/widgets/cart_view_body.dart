import 'package:flutter/material.dart';

import '../../../../core/helper_function/build_app_bar.dart';
import 'cart_header.dart';
class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column (
      children: [
        buildAppBar(text: 'cart'),
        SizedBox(height: 20,) ,

        CartHeader(),
      ],

    );
  }
}
