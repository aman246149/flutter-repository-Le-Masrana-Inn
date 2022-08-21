import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practo/app/homepage/data/api.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  String name = "";
  String email = "";
  String gender = "";
  String birthday = "";
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterFormTrigger>((event, emit) async {
      final res = await Api().register(name, email, gender, birthday);

      res.fold((left) => emit(RegisterErrorState(message: left)),
          (right) => emit(RegisterSuccessState(message: right)));
    });
  }
}
