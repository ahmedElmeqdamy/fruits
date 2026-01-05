import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import '../../../../core/fixed_widgets/custom_button.dart';
import '../../../../core/helper_function/build_app_bar.dart';
import 'cart_header.dart';
import 'cart_items_list.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(text: 'cart'),
                  SizedBox(height: 20),

                  CartHeader(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            CartItemsList(cartItems: context.watch<CartCubit>().cartEntity.cartItems),
          ],
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: CustomCartButton(),
        ),
      ],
    );
  }
}


