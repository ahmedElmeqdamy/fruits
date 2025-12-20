import '../../../domain/entities/user_entity.dart';

abstract class SignInStates {}

final class SignInInitial extends SignInStates {}

final class SignInLoading extends SignInStates {}

final class SignInSuccess extends SignInStates {
  SignInSuccess({required this.user});
  final UserEntity user;
}

final class SignInFailure extends SignInStates {
  SignInFailure({required this.message});
  final String message;
}
