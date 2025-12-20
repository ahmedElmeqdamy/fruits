import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "I don't have an account?",
          style: AppStyles.regular13.copyWith(color: Colors.grey,fontSize: 15),
          children: [
            TextSpan(
              text: " take me to Register",
              style: AppStyles.regular13.copyWith(color: Colors.blue[300]),
              recognizer:TapGestureRecognizer()
                ..onTap = () {

                  // Navigate to Register
                  Navigator.pushNamed(context,'signUpView' );
                },
            ),
          ],
        ),
      ),
    );
  }
}
