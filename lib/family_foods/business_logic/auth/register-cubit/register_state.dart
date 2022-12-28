// ignore_for_file: must_be_immutable
part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String error;
  RegisterErrorState({required this.error});
}

class VisiblePasswordState extends RegisterState {}

class VisibleConfirmPasswordState extends RegisterState {}
