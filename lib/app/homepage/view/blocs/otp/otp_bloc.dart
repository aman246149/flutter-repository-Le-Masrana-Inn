import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practo/app/homepage/data/api.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<SendOtpTrigger>((event, emit) async {
      final res = await Api().sendOtp(event.phoneNumber);
      res.fold((left) => emit(OtpErrorState(error: left)),
          (right) => emit(OtpSuccessState(otp: right)));
    });
  }
}
