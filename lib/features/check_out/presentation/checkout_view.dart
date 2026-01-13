import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper_function/build_app_bar.dart';
import 'package:fruits/features/check_out/domain/entites/order_entity.dart';
import 'package:fruits/features/check_out/presentation/widgets/checkout_view_body.dart';
import 'package:fruits/features/check_out/presentation/widgets/checkout_view_body_bloc_builder.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';
import 'package:provider/provider.dart';

import '../../../core/helper_function/get_user.dart';
import '../../../core/repos/order_repo/orders_repo.dart';
import '../../../core/services/get_it_service.dart';
import 'manager/add_order_cubit/add_order_cubit.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({required this.cartEntity, super.key});

  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBar(text: 'shipping', showNotification: false),

        body: Provider.value(
          value: OrderEntity(cartEntity: cartEntity, uID: getUser().uid),

          child: CheckoutViewBodyBlocBuilder(),
        ),
      ),
    );
  }
}

