// ignore_for_file: must_be_immutable
part of 'login_cubit.dart';

@immutable
abstract class AuthState {}

class LoginInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  LoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends AuthState {
  String error;
  LoginErrorState({required this.error});
}

class PasswordVisibilityState extends AuthState {}

class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}
