import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_style.dart';

import 'active_shipping_item_dot.dart';
import 'in_active_shipping_item_dot.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    required this.onTap,
    required this.isActive,
    required this.price,
    required this.subtitle,
    required this.title,
    super.key,
  });

  final String title;
  final String subtitle;
  final String price;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration:  Duration(milliseconds: 300),
        width: 343,
        height: 81,
        padding:  EdgeInsets.only(top: 16, bottom: 16, right: 28, left: 13),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isActive ? Colors.blueAccent : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isActive ? ActiveShippingItemDot() : InActiveShippingItemDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.semiBold13),
                  Text(
                    subtitle,
                    //'Delivery to your location',
                    style: AppStyles.regular13.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppStyles.bold13.copyWith(
                    color: Colors.blueAccent.withOpacity(0.5),
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
