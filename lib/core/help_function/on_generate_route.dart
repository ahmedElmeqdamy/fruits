import 'package:flutter/material.dart';
import 'package:fruits/features/Splash/presentation/views/splash_view.dart';
import 'package:fruits/features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
  case 'splashView':
  return MaterialPageRoute(builder: (context) => SplashView());

  case 'onBoardingView':
  return MaterialPageRoute(builder: (context) => OnBoardingView());
  // Add other routes here as needed
  default:
  return MaterialPageRoute(builder: (_) => const Scaffold(
  body: Center(child: Text('un')),
  ));
  }
}