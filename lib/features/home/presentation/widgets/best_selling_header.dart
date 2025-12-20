import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('bestSellingView');
        },
        child: Row(
          children: [
            const Text('Best Selling', style: AppStyles.bold16),
            const Spacer(),
            Text(
              'See More',
              style: AppStyles.bold16.copyWith(color: const Color(0xff889091)),
            ),
          ],
        ),
      ),
    );
  }
}
