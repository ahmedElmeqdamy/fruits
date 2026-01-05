import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/home/presentation/products_view.dart';
import 'package:fruits/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:fruits/features/home/presentation/widgets/home_view.dart';
import 'package:fruits/features/home/presentation/widgets/main_view_body.dart';
import 'package:fruits/features/home/presentation/widgets/main_view_body_bloc_consumer.dart';

import 'cart_view.dart';
import 'cubits/cart_cubit/cart_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigatorBar(
          onItemTapped: (value) {
            currentViewIndex = value;
            setState(() {});
          },
        ),

        // i use indexedStack to show only one view at a time
        body: SafeArea(
          child: MainViewBodyBodyBlocConsumer(currentViewIndex: currentViewIndex),
        ),
      ),
    );
  }
}




