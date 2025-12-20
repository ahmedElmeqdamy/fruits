import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper_function/on_generate_route.dart';

import 'core/services/bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'core/services/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  //initialize setup in main method 2-2  get-it package

  //second step initialize shared prefs 2/4 then go to place where need to use prefs
  WidgetsFlutterBinding.ensureInitialized();

  //setup bloc observer 2-2
  Bloc.observer = BlocWatch();
  await Prefs.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
        brightness: Brightness.light,
      ),

      initialRoute: 'splashView',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
