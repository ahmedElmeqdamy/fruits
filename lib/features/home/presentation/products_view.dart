import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/product_cubit/product_cubit.dart';
import 'package:fruits/core/repos/product_repo/product_repos.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/features/home/presentation/widgets/products_views_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: ProductsViewsBody(),
    );
  }
}
