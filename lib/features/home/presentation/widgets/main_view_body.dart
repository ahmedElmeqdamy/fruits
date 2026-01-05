import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/products_view.dart';
import 'package:fruits/features/home/presentation/widgets/home_view.dart';
import '../cart_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [HomeView(), ProductsView(), CartView()],
    );
  }
}
