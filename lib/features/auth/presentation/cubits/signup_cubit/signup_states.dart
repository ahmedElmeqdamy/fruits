import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';

//first create states 1-5
@immutable
abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  SignUpSuccess(this.userEntity);
  final UserEntity userEntity;
}

final class SignUpFailure extends SignUpState {
  SignUpFailure(this.message);
  final String message;
}
