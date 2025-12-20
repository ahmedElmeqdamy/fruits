import 'package:flutter/material.dart';
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [

          Expanded(
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('OR'),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
