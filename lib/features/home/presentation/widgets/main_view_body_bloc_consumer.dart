import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper_function/box_error.dart';

import '../cubits/cart_cubit/cart_cubit.dart';
import '../cubits/cart_cubit/cart_state.dart';
import 'main_view_body.dart';

class MainViewBodyBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ShowBoxError.show(context, 'Product added to cart');
        } if(state is CartItemRemoved){
          ShowBoxError.show(context, 'Product removed from cart');

        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}