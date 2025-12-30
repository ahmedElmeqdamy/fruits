import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({required this.image, super.key});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SvgPicture.asset(image, color: Colors.grey));
  }
}
