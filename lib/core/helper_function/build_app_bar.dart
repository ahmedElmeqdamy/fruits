import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';


AppBar buildAppBar({required String text }) {
  return AppBar(
    centerTitle: true,
    leading: const Icon(Icons.arrow_back_ios_new),
    actions:  [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Icon(Icons.notifications),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title:  Text(
     text,
      textAlign: TextAlign.center,
      style: AppStyles.bold19,
    ),
  );
}