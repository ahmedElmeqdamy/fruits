import 'package:flutter/material.dart';

abstract class AppDecoration {
static var greyAppDecoration = ShapeDecoration(
  color: Colors.grey.withOpacity(0.1),

  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  )
);

}