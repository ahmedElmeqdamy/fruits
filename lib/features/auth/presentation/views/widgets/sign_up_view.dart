import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signup_view_bloc_consumer.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../domain/repos/auth_repo.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    //third create BlocProvider 3-5 in wanted screen
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('New Account')),

        body: const SignupViewBlocConsumer(),
      ),
    );
  }
}
