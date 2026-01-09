import 'package:flutter/material.dart';

class AppData extends InheritedWidget {
  final String username;

  const AppData({
    super.key,
    required this.username,
    required super.child,
  });

  static AppData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppData>()!;
  }

  @override
  bool updateShouldNotify(AppData oldWidget) {
    return username != oldWidget.username;
  }
}
