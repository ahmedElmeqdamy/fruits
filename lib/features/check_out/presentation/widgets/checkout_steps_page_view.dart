import 'package:flutter/material.dart';
import 'package:fruits/features/check_out/presentation/widgets/payment_section.dart';
import 'package:fruits/features/check_out/presentation/widgets/shipping_section.dart';

import 'address_input_section.dart';
class CheckoutStepsPageView extends StatelessWidget {
    CheckoutStepsPageView({
    required this.formKey, super.key,
    required this.pageController,
  });

  final PageController pageController;

  final GlobalKey<FormState> formKey ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: PageView.builder(
        controller: pageController,
        itemCount: getPage().length,
        physics: NeverScrollableScrollPhysics(),

        itemBuilder: (context, index) {
          return getPage()[index];  
        },
      ),
    );
  }

  List<Widget> getPage(){
    return [
      ShippingSection(),
      AddressInputSection(formKey: formKey,),
      PaymentSection(),

    ];
  }
}