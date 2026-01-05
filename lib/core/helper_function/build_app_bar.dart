import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

AppBar buildAppBar({required String text, bool showNotification = true}) {
  return AppBar(
    centerTitle: true,
    leading: const Icon(Icons.arrow_back_ios_new),
    actions: [
      showNotification
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.notifications),
            )
          : SizedBox(),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(text, textAlign: TextAlign.center, style: AppStyles.bold19),
  );
}
