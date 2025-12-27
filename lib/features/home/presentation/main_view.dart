import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:fruits/features/home/presentation/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigatorBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}
