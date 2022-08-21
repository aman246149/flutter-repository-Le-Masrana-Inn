part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final String message;

  RegisterSuccessState({required this.message});
}

class RegisterErrorState extends RegisterState {
  final String message;

  RegisterErrorState({required this.message});

}
