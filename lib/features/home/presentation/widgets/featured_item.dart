import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits/core/utils/app_text_style.dart';
import 'package:fruits/features/home/presentation/widgets/featured_button_item.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.sizeOf(context).width,

        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                bottom: 20,

                child: Image.asset('assets/images/strobery.png'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: svg.Svg('assets/images/background.svg'),
                      fit: BoxFit.fill,
                    ),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'عروض العيد ',
                        style: AppStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'خصم 25%',
                        style: AppStyles.bold19.copyWith(color: Colors.white),
                      ),
                      FeaturedItemButton(onPressed: () {}),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
