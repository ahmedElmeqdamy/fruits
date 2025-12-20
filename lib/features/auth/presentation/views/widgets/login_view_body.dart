import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/presentation/views/widgets/social_auth.dart';

import '../../../../../core/fixed_widgets/custom_button.dart';
import '../../../../../core/fixed_widgets/custom_text_field.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'do_not_have_an_account.dart';
import 'or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              autovalidateMode: autoValidateMode,
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    hintText: 'please Enter Email',
                    suffixIcon: const Icon(Icons.email_outlined),
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    onSaved: (value) {
                      password = value!;
                    },
                    hintText: 'please Enter password',
                    suffixIcon: const Icon(Icons.remove_red_eye),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        textDirection: TextDirection.ltr,
                        'forget my passcode?',
                        style: AppStyles.semiBold13.copyWith(
                          color: Colors.blue[300],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const DoNotHaveAnAccount(),
                  const SizedBox(height: 30),
                  const OrDivider(),
                  const SocialAuth(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                backgroundColor: Colors.lightBlueAccent,
                textColor: Colors.white,
                text: 'please Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                    // Navigator.of(context).pushReplacementNamed('loginView');
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.onUserInteraction;
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
