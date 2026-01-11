import 'package:flutter/material.dart';
import 'package:fruits/features/check_out/presentation/widgets/shipping_address_widget.dart';

import 'order_summery_widget.dart';

class PaymentSection extends StatelessWidget {
  final PageController pageController;
  const PaymentSection({required this.pageController, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        OrderSummeryWidget(),
        const SizedBox(height: 16),
        ShippingAddressWidget(pageController: pageController,),
      ],
    );
  }
}
