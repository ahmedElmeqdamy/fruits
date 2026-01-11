import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/check_out/domain/entites/order_entity.dart';

import '../../../../core/fixed_widgets/custom_text_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({required this.valueNotifier, required this.formKey, super.key});

  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //this is builder of value notifier state management
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueNotifier,
        builder: (context, value, child) => Form(
          autovalidateMode: value,
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your full name';
                  }
                  return null;
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.name = value;
                },
                hintText: 'please enter your full name',
                keyboardType: TextInputType.name,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.email = value;
                },
                hintText: 'please enter your Email-address',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your address';
                  }
                  return null;
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.address = value;
                },
                hintText: 'please enter your address',
                keyboardType: TextInputType.streetAddress,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your city';
                  }
                  return null;
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.city = value;
                },
                hintText: 'please enter your city',
                keyboardType: TextInputType.streetAddress,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.phoneNumber =
                      value;
                },
                hintText: 'please enter your phone number',
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
