import 'package:flutter/material.dart';
import 'package:fruits/core/helper_function/build_app_bar.dart';
import 'package:fruits/features/check_out/presentation/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'shipping' ,showNotification: false),

      body: CheckoutViewBody(),
    );
  }
}
