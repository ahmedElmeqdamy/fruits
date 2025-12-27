import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/home/presentation/widgets/search_text_field.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import 'best_selling_grid_view.dart';
import 'best_selling_grid_view_bloc_builder.dart';
import 'best_selling_header.dart';
import 'custom_app_bar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

//we convert to StatefulWidget to use cubit when I open homeView I can see products
  @override
  void initState() {
   // context.read<ProductCubit>().getProducts();
   context.read<ProductCubit>().getBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 20),
              SearchTextField(),
              SizedBox(height: 20),
              FeaturedList(),
              BestSellingHeader(),
              SizedBox(height: 20),
            ],
          ),
        ),
        BestSellingGirdViewBlocBuilder(),
      ],
    );
  }
}

