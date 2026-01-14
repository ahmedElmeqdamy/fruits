import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits/core/fixed_widgets/custom_button.dart';
import 'package:fruits/core/helper_function/box_error.dart';
import 'package:fruits/core/utils/app_keys.dart';
import 'package:fruits/features/check_out/domain/entites/order_entity.dart';
import 'package:fruits/features/check_out/presentation/widgets/checkout_steps.dart';
import '../../domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import '../manager/add_order_cubit/add_order_cubit.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //simple state management to control the autoValidate mode of the form
  final ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: _formKey,
              valueNotifier: valueNotifier,
            ),
          ),
          CustomButton(
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            text: getNextButtonText(currentPageIndex),
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handleAddressSectionValidation();
              } else {
                _processPayment(context);
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context
        .read<OrderEntity>()
        .payedWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.slowMiddle,
      );
    } else {
      ShowBoxError.show(context, 'Please select the payment method');
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'next';
      case 1:
        return 'next';
      case 2:
        return 'pay with paypal';
      default:
        return 'Error';
    }
  }

  void _handleAddressSectionValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.slowMiddle,
      );
    } else {
      valueNotifier.value = AutovalidateMode.onUserInteraction;
    }
  }

  void _processPayment(BuildContext context) {
    final orderEntity = context.read<OrderEntity>();
    final paypalPaymentEntity = PaypalPaymentEntity.fromEntity(orderEntity);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) =>
          PaypalCheckoutView(
              sandboxMode: true,
              clientId: paypalClientId,
              secretKey: paypalSecret,
              transactions: [
              paypalPaymentEntity.toJson(),
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        print("onSuccess: $params");
      },
      onError: (error) {
        print("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:');
      },
    ),
    ));
  }
}
