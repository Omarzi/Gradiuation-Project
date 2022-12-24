// ignore_for_file: must_be_immutable, overridden_fields

part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {
  final String? email;
  final String? otb;
  final String? id;
  final States forgetNetState;
  const ForgetPasswordState(
      {this.email,
      this.otb,
      this.id,
      this.forgetNetState = States.success});
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class GetForgetPasswordState extends ForgetPasswordState {
  final States forgetState_;
  const GetForgetPasswordState({required this.forgetState_}) : super (forgetNetState: forgetState_);
}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordSendEmailState extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  String error;
  ForgetPasswordErrorState({required this.error});
}

class SendSixDigitsLoadingState extends ForgetPasswordState {
  final String otb_;

  const SendSixDigitsLoadingState({
    required this.otb_,
  }) : super(otb: otb_);
}

class SendSixDigitsSucessState extends ForgetPasswordState {
  SixDigits sixDigits;
  final String id_;

  final String email_;
  SendSixDigitsSucessState({
    required this.sixDigits,
    required this.email_,
    required this.id_,
  }) : super(email: email_, id: id_);
}

class SendSixDigitsErrorState extends ForgetPasswordState {}

class UpdateNewPasswordState extends ForgetPasswordState {}

class UpdateNewPasswordLoadingState extends ForgetPasswordState {}

class UpdateNewPasswordSuccessState extends ForgetPasswordState {}

class UpdateNewPasswordErrorState extends ForgetPasswordState {}
