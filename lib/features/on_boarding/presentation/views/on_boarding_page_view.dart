import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_style.dart';
import 'package:fruits/features/on_boarding/presentation/views/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({required this.pageController, super.key});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: 'assets/images/image_page_view.svg',
          backgroundImage: 'assets/images/page_view_background.svg',
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fruit',
                style: AppStyles.bold23.copyWith(color: Colors.blue),
              ),
              Text(
                '  HUB ',
                style: AppStyles.bold23.copyWith(color: Colors.black12),
              ),
              const Text('مرحبًا بك في ', style: AppStyles.bold23),
            ],
          ),
          isVisible: false,
        ),
        PageViewItem(
          image: 'assets/images/pineapple.svg',
          backgroundImage: 'assets/images/page_view_background2.svg',
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text(
            'ابحث وتسوق',
            style: AppStyles.bold23.copyWith(color: Colors.blue),
          ),
          isVisible: true,
        ),
      ],
    );
  }
}
