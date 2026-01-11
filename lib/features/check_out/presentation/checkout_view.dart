import 'package:flutter/material.dart';
import 'package:fruits/core/helper_function/build_app_bar.dart';
import 'package:fruits/features/check_out/domain/entites/order_entity.dart';
import 'package:fruits/features/check_out/presentation/widgets/checkout_view_body.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';
import 'package:provider/provider.dart';

import '../../../core/helper_function/get_user.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({required this.cartEntity, super.key});

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'shipping', showNotification: false),

      body: Provider.value(
        value: OrderEntity(cartEntity: cartEntity, uID: getUser().uid),

        child: CheckoutViewBody(),
      ),
    );
  }
}
