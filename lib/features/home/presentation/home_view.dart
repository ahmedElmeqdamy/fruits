import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:fruits/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigatorBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
