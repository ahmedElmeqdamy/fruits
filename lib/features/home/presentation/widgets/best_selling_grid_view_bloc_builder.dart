import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/product_cubit/product_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/cubits/product_cubit/product_cubit.dart';
import '../../../../core/helper_function/get_dummy_product.dart';
import 'best_selling_grid_view.dart';

class BestSellingGirdViewBlocBuilder extends StatelessWidget {
  const BestSellingGirdViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return BestSellingGridView(products: state.products);
        } else if (state is ProductError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Something went wrong')),
          );
        } else {
          return Skeletonizer.sliver(
            // enabled: true,
            child: BestSellingGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
