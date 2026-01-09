import 'package:flutter/material.dart';
import 'package:fruits/features/check_out/presentation/widgets/active_step_item.dart';
import 'package:fruits/features/check_out/presentation/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    required this.index,
    required this.isActive,
    required this.text,
    super.key,
  });

  final String text;
  final String index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(text: text, index: index),
      secondChild: ActiveStepItem(text: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: Duration(seconds: 1),
    );
  }
}
