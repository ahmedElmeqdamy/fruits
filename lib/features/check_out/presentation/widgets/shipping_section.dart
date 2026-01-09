import 'package:flutter/material.dart';
import 'package:fruits/features/check_out/presentation/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          title: 'Cash on Delivery',
          subtitle: 'Delivery to your location',
          price: '40 LE', isActive: selectedIndex == 0,
        ),
        SizedBox(height: 16),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          title: 'Online Payment',

          subtitle: 'Please choose your payment method',
          price: '102 LE', isActive: selectedIndex == 1,
        ),
      ],
    );
  }
}
