part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginOTPevent extends LoginEvent {
  final String phoneNumber;
  final String otp;

  LoginOTPevent({required this.phoneNumber, required this.otp});
}
