import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.icon,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderRadius = 12,
    this.height = 50,
    this.width,
    this.iconSize = 24,
    this.showBorder = true,
  });

  final String text;
  final VoidCallback onPressed;
  final Widget? icon; // Icon أو Image
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double? width;
  final double iconSize;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: showBorder
                ? BorderSide(color: Colors.grey.shade300)
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Row(
          children: [
            // ثابت العرض علشان الأيقونات تبقى محاذية
            SizedBox(
              width: 30, // نفس المقاس لكل الأزرار
              height: iconSize,
              child: icon,
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
