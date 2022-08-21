import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practo/app/homepage/data/api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginOTPevent>((event, emit) async {
      await Api().login(event.phoneNumber, event.otp);
    });
  }
}
