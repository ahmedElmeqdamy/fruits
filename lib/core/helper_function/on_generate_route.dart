import 'package:flutter/material.dart';
import 'package:fruits/features/auth/presentation/views/login_view.dart';
import 'package:fruits/features/auth/presentation/views/widgets/sign_up_view.dart';
import 'package:fruits/features/on_boarding/presentation/on_boarding_view.dart';
import 'package:fruits/features/splash/presentation/views/splash_view.dart';

import '../../features/best_selling_fruits/presentation/best_selling_view.dart';
import '../../features/home/presentation/main_view.dart';

//create on generate Route function 1-2 go to main to see section 2
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'splashView':
      return MaterialPageRoute(builder: (context) => const SplashView());

    case 'onBoardingView':
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case 'loginView':
      return MaterialPageRoute(builder: (context) => const LoginView());

    case 'homeView':
      return MaterialPageRoute(builder: (context) => const MainView());

    case 'signUpView':
      return MaterialPageRoute(builder: (context) => const SignUpView());

    case 'bestSellingView':
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
