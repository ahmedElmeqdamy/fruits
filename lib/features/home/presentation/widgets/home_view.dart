import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../core/cubits/product_cubit/product_cubit.dart";
import "../../../../core/repos/product_repo/product_repos.dart";
import "../../../../core/services/get_it_service.dart";
import "home_view_body.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt<ProductRepo>()),
      child: const HomeViewBody(),
    );
  }
}
