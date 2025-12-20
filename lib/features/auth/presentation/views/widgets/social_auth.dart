import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/features/auth/presentation/views/widgets/social_button.dart';

import '../../cubits/signin_cubit/signin_cubit.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButton(
          text: 'sign In with Google',

          onPressed: () {
            context.read<SignInCubit>().signInWithGoogle();
          },
          icon: SvgPicture.asset('assets/images/google_icon.svg'),
        ),
        const SizedBox(height: 10),
        SocialButton(
          text: 'sign In with Facebook',

          onPressed: () {
            context.read<SignInCubit>().signInWithFacebook();
          },
          icon: SvgPicture.asset('assets/images/face_icon.svg'),
        ),

        Platform.isIOS
            ? Column(
                children: [
                  const SizedBox(height: 10),
                  SocialButton(
                    text: 'sign In with apple',

                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/apple_icon.svg'),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
