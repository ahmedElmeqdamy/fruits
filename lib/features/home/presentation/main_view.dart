import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/products_view.dart';
import 'package:fruits/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:fruits/features/home/presentation/widgets/home_view.dart';

import 'cart_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigatorBar(
        onItemTapped: (value) {
          currentViewIndex = value;
          setState(() {});
        },
      ),

      // i use indexedStack to show only one view at a time
      body: SafeArea(
        child: IndexedStack(
          index: currentViewIndex,
          children: [HomeView(), ProductsView() , CartView()],
        ),
      ),
    );
  }
}
