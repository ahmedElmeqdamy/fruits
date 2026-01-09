import 'package:flutter/material.dart';
import 'package:fruits/core/fixed_widgets/custom_button.dart';
import 'package:fruits/features/check_out/presentation/widgets/checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

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

    super.dispose();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(currentPageIndex: currentPageIndex, pageController: pageController,),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomButton(
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            text: getNextButtonText(currentPageIndex),
            onPressed: () {
              pageController.animateToPage(
                currentPageIndex + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
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
}
