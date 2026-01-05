import 'package:flutter/material.dart';
import 'package:fruits/features/check_out/presentation/widgets/active_step_item.dart';

import 'in_active_step_item.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [InActiveStepItem()]);
  }
}
