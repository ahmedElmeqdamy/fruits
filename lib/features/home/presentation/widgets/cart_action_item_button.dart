import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

import '../../../../core/utils/app_text_style.dart';
import 'one_cart_action_item_button.dart';

class CartActionItemButton extends StatelessWidget {

  const CartActionItemButton({required this.cartItemEntity, super.key});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OneCartActionItemButton(
          icon: Icons.add,
          color: Colors.blueAccent,
          onPressed: () {
            cartItemEntity.increaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);

          },
          iconColor: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${cartItemEntity.count.toString()}',
            style: AppStyles.bold16.copyWith(color: Colors.orange),
          ),
        ),
        OneCartActionItemButton(
          icon: Icons.remove,
          color: Colors.grey,
          onPressed: () {
            cartItemEntity.decreaseCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
