import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

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
                Image.asset(
                  'assets/images/watermelon.png',
                  fit: BoxFit.contain,
                ),
                ListTile(
                  title: Text(
                    'Watermelon',
                    style: AppStyles.bold16.copyWith(color: Colors.black),
                  ),
                  subtitle: Text(
                    '20 \$ / 1 kilo',
                    style: AppStyles.regular13.copyWith(color: Colors.blue),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
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
