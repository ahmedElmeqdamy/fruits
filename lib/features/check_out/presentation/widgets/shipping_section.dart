import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/check_out/domain/entites/order_entity.dart';
import 'package:fruits/features/check_out/presentation/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}
// we use AutomaticKeepAliveClientMixin to save my state
class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin{
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const SizedBox(height: 30),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
              context.read<OrderEntity>().payedWithCash = true;
            });
          },
          title: 'Cash on Delivery',
          subtitle: 'Delivery to your location',
          price: '${( context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()+40)
              .toString()}LE',
          isActive: selectedIndex == 0,
        ),
        const SizedBox(height: 16),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
              context.read<OrderEntity>().payedWithCash = false;
            });
          },
          title: 'Online Payment',

          subtitle: 'Please choose your payment method',
          price:'${ context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString()} LE',
          isActive: selectedIndex == 1,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
