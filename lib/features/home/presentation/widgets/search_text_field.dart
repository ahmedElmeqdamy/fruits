import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/fixed_widgets/custom_text_field.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Search',
      suffixIcon: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/images/search.svg'),
      ),
    );
  }
}
