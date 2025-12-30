import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/home/presentation/widgets/product_view_header.dart';
import 'package:fruits/features/home/presentation/widgets/search_text_field.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/helper_function/build_app_bar.dart';
import 'product_grid_view_bloc_builder.dart';

class ProductsViewsBody extends StatefulWidget {
  const ProductsViewsBody({super.key});

  @override
  State<ProductsViewsBody> createState() => _ProductsViewsBodyState();
}

class _ProductsViewsBodyState extends State<ProductsViewsBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              buildAppBar(text: 'products'),
              SizedBox(height: 20),
              SearchTextField(),
              SizedBox(height: 20),
              ProductViewHeader(
                productLenght: context.read<ProductCubit>().productLength,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        ProductGirdViewBlocBuilder(),
      ],
    );
  }
}
