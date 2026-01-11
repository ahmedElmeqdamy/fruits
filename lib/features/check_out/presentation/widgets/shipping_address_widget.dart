import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/features/check_out/presentation/widgets/payment_item.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../domain/entites/order_entity.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    log(context.read<OrderEntity>().toString());
    return PaymentItem(
      title: 'Delivery Address',
      child: Row(
        children: [
        Icon(Icons.location_on),
          const SizedBox(
            width: 8,
          ),
          Text(
            ' ${context.read<OrderEntity>().shippingAddress.toString()}',
            textAlign: TextAlign.right,
            style: AppStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                   'assets/images/vuesax/outline/edit.svg',
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Edit',
                    style: AppStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}