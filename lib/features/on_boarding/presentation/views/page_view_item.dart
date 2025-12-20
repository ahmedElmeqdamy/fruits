import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/utils/app_text_style.dart';

import '../../../../core/services/shared_preferences.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    required this.isVisible,
    super.key,
  });

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              // we put positioned fill to make the background image take the full size of the stack
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: SvgPicture.asset(image),
              ),

              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool('isOnBoardingView', true);
                    Navigator.of(context).pushReplacementNamed('loginView');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'skip',
                      style: AppStyles.regular13.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        title,
        const SizedBox(height: 16),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppStyles.semiBold13.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
