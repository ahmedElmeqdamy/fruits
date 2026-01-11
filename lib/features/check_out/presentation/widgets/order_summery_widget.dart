import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/check_out/presentation/widgets/payment_item.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../domain/entites/order_entity.dart';

class OrderSummeryWidget extends StatelessWidget {
  const OrderSummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'Order Summary',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Subtotal',
                style: AppStyles.regular13.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()}}LE',
                style: AppStyles.semiBold16.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'shipping fees',
                style: AppStyles.regular13.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Spacer(),
              Text(
                '55 LE',
                style: AppStyles.semiBold16.copyWith(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(thickness: 0.5, color: Colors.black.withOpacity(0.5)),
          SizedBox(height: 9),
          Row(
            children: [
              Text(
                'Total',
                style: AppStyles.bold16.copyWith(color: Colors.black),
              ),
              Spacer(),
              Text(
                '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 55}LE',
                style: AppStyles.semiBold16.copyWith(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
