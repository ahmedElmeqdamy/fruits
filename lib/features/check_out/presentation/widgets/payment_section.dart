import 'package:flutter/material.dart';
import 'package:fruits/features/check_out/presentation/widgets/payment_item.dart';

import 'order_summery_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [SizedBox(height: 16), OrderSummeryWidget()]);
  }
}
