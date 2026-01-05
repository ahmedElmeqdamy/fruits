import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xffEBF9F1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          //we use (watch) to rebuild this widget it search nearest build method and rebuild it
          'you have ${context.watch<CartCubit>().cartEntity.cartItems.length} itmes in Cart',
        ),
      ),
    );
  }
}
