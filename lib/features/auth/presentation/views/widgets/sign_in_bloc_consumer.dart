import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helper_function/box_error.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import '../../cubits/signin_cubit/signin_states.dart';
import 'login_view_body.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.of(context).pushReplacementNamed('homeView');
          log('success login');
        }

        if (state is SignInFailure) {
          ShowBoxError.show(context, state.message);
          log(state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
