import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../entity/product_entity.dart';
import '../utils/app_text_style.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({required this.productEntity, super.key});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          Positioned.fill(
            // top: 50,
            // bottom: 10,
            child: Column(
              children: [
                // SizedBox(height: 10,),
               productEntity.imageUrl != null ?  Flexible(
                  child:  Image.network(
                    productEntity.imageUrl!,
                    fit: BoxFit.contain,
                  ),
                ):Container(
                 color: Colors.red,
                 height: 100,
                 width: 100,
               ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style: AppStyles.bold16.copyWith(color: Colors.black),
                  ),
                  subtitle: Text(
                    '${productEntity.price} \$ / ${productEntity.unitAmount}',
                    style: AppStyles.regular13.copyWith(color: Colors.blue),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addItemToCart(productEntity);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
