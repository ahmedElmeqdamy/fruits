import 'package:flutter/material.dart';

import '../../../../core/fixed_widgets/custom_text_field.dart';

class AddressInputSection extends StatelessWidget {
    AddressInputSection({required this.formKey, super.key});
  final GlobalKey<FormState> formKey  ;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'please enter your full name',
            keyboardType: TextInputType.name,
          ),
          CustomTextFormField(
            hintText: 'please enter your Email-address',
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextFormField(
            hintText: 'please enter your address',
            keyboardType: TextInputType.streetAddress,
          ),
          CustomTextFormField(
            hintText: 'please enter your city',
            keyboardType: TextInputType.streetAddress,
          ),
          CustomTextFormField(
            hintText: 'please enter your phone number',
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
