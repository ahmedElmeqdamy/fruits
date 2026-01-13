
import 'package:flutter/material.dart';

@immutable
sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}
final class AddOrderSuccess extends AddOrderState {}
final class AddOrderFailure extends AddOrderState {
  AddOrderFailure(this.errorMessage);
  final String errorMessage;
}
final class AddOrderLoading extends AddOrderState {}



