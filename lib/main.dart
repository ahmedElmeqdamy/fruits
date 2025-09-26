import 'package:flutter/material.dart';

import 'core/help_function/on_generate_route.dart';
import 'features/Splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitsApp());
}



class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fruits_app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: 'splashView',
      onGenerateRoute: onGenerateRoute,


    );
  }
}
