import 'package:flutter/material.dart';
import 'package:fruits/features/best_selling_fruits/presentation/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        centerTitle: true,
        title: const Text('Best Selling'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/notif.png'),
          ),
        ],
      ),
      body: const BestSellingViewBody(),
    );
  }
}
