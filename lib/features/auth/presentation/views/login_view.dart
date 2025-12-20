import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/features/auth/presentation/views/widgets/sign_in_bloc_consumer.dart';

import '../../domain/repos/auth_repo.dart';
import '../cubits/signin_cubit/signin_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          centerTitle: true,
          title: const Text('auth_view'),
        ),
        body: const SignInBlocConsumer(),
      ),
    );
  }
}
