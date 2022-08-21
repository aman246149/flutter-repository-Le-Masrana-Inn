part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpSuccessState extends OtpState {
  final String otp;

  OtpSuccessState({required this.otp});
}


class OtpErrorState extends OtpState {
  final String error;

  OtpErrorState({required this.error});
}

