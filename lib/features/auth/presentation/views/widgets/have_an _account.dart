import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "I have an account?",
          style: AppStyles.regular13.copyWith(color: Colors.grey,fontSize: 15),
          children: [
            TextSpan(
              text: "  take me to sign in",
              style: AppStyles.semiBold13.copyWith(color: Colors.blue[300],fontSize: 15),
              recognizer:TapGestureRecognizer()
                ..onTap = () {

                  // Navigate to Register
                  Navigator.pop(context );
                },
            ),
          ],
        ),
      ),
    );
  }
}
