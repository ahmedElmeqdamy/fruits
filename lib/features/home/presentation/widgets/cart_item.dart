import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import 'cart_action_item_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({required this.cartItemEntity, super.key});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      // I use build when in this case to build one item enough
      buildWhen: (prev, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        log('we are building this widget ');
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: Image.network(cartItemEntity.productEntity.imageUrl!),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: AppStyles.bold13,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              cartItemEntity,
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/images/vuesax/outline/trash.svg',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()} kilo',
                      style: AppStyles.regular13.copyWith(color: Colors.orange),
                    ),

                    Row(
                      children: [
                        CartActionItemButton(cartItemEntity: cartItemEntity),
                        Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} LE',
                          style: AppStyles.bold16.copyWith(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
