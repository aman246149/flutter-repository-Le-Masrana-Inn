part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class SendOtpTrigger extends OtpEvent {
  final String phoneNumber;

  SendOtpTrigger({required this.phoneNumber});
}
