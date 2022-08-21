part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {
  final String message;

  LoginSuccessState({required this.message});
}

class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState({required this.message});

}
