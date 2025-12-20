import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/presentation/views/widgets/have_an%20_account.dart';
import 'package:fruits/features/auth/presentation/views/widgets/terms_and_condition.dart';

import '../../../../../core/fixed_widgets/custom_button.dart';
import '../../../../../core/fixed_widgets/custom_text_field.dart';
import '../../../../../core/helper_function/box_error.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isSecure = true;
  late String name, email, password;
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        autovalidateMode: autoValidateMode,
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      onSaved: (value) {
                        name = value!;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                      hintText: ' name please',
                      suffixIcon: const Icon(Icons.account_circle_outlined),
                    ),
                    CustomTextFormField(
                      obscureText: isSecure,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your password';
                        }
                        if (value.length < 6) {
                          return 'password must be at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                      hintText: 'password please',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSecure = !isSecure;
                          });
                        },
                        child: isSecure
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                      hintText: 'Email please ',
                      suffixIcon: const Icon(Icons.email_outlined),
                    ),
                    TermsAndConditionWidget(
                      onChanged: (value) {
                        setState(() {
                          isTermsAccepted = value;
                        });
                      },
                    ),
                    const SizedBox(height: 50),
                    const HaveAnAccount(),
                    const SizedBox(height: 20),
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
                  text: 'create an account',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      if (isTermsAccepted) {
                        //fifth step call cubit method 5-5
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              name,
                              email,
                              password,
                            );
                      } else {
                        ShowBoxError.show(
                          context,
                          'Please accept terms and conditions',
                        );
                      }
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
      ),
    );
  }
}
