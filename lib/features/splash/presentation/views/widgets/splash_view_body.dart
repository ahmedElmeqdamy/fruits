import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/services/firebase_auth_services.dart';

import '../../../../../core/services/shared_preferences.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //we put cross stretch cause i need to stretch third image
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [SvgPicture.asset('assets/images/plant.svg')]),
        SvgPicture.asset('assets/images/image_page_view.svg'),
        SvgPicture.asset('assets/images/bottom_splash.svg', fit: BoxFit.fill),
      ],
    );
  }

  void executeNavigation() {
    //fourth step check the state of onboarding view 4/4 then go to place where need to use prefs
    final bool isOnBoardingViewSeen = Prefs.getBool('isOnBoardingView');

    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingViewSeen) {
        log('isOnBoardingViewSeen true .........');
        final isLoggedIn = FirebaseAuthServices().isLoggedIn();
        if (isLoggedIn) {
          log('logging in.........');
          Navigator.pushReplacementNamed(context, 'homeView');
        } else {
          Navigator.pushReplacementNamed(context, 'loginView');
        }
      } else {
        log('isOnBoardingViewSeen false .........');
        Navigator.pushReplacementNamed(context, 'onBoardingView');
      }
    });
  }
}
