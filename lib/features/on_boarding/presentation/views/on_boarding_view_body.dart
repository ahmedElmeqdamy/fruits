import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/fixed_widgets/custom_button.dart';
import 'package:fruits/features/on_boarding/presentation/views/on_boarding_page_view.dart';

import '../../../../core/services/shared_preferences.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: currentPage == 0
                ? Colors.blue
                : Colors.blue.withOpacity(0.3),
            color: currentPage == 1
                ? Colors.blue
                : Colors.blue.withOpacity(0.3),
          ),
        ),
        const SizedBox(height: 20),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: CustomButton(
            backgroundColor: Colors.blue.withOpacity(0.9),
            textColor: Colors.white,
            text: 'start now',
            onPressed: ()  {
              //third step save the state of onboarding view 3/4 then go to place where need to use prefs
               Prefs.setBool('isOnBoardingView', true);
              Navigator.of(context).pushReplacementNamed('loginView');
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
