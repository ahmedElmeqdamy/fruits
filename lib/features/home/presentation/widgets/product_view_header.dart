import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_text_style.dart';

class ProductViewHeader extends StatelessWidget {

  final int productLenght;
  const ProductViewHeader({required this.productLenght, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
           Text('$productLenght -Result', style: AppStyles.bold16),
           const Spacer(),
          SvgPicture.asset('assets/images/filter.svg'),

        ],
      ),
    );
  }
}
