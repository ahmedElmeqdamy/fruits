import "package:flutter/material.dart";
import "package:fruits/features/home/presentation/widgets/best_selling_grid_view.dart";
import "package:fruits/features/home/presentation/widgets/search_text_field.dart";

import "best_selling_header.dart";
import "custom_app_bar.dart";
import "featured_list.dart";

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        BestSellingGridView(),
      ],
    );
  }
}
