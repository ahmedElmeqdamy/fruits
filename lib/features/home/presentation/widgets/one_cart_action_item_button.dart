import 'package:flutter/material.dart';

class OneCartActionItemButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onPressed;

  const OneCartActionItemButton({
    required this.iconColor, required this.color,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding:  EdgeInsets.all(2),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: FittedBox(child: Icon(icon, color: iconColor,)),
      ),
    );
  }
}
