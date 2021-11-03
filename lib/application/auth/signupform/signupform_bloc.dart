import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  SignupformBloc()
      : super(SignupformState(
            isSubmitting: false, showValidationMessages: false)) {
    on<RegisterWithEMailAndPasswordPressed>((event, emit) {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true));
      } else {
        emit(
            SignupformState(isSubmitting: true, showValidationMessages: false));
        // TODO: trigger firebase registration
      }
    });

    on<SignInWithEMailAndPasswordPressed>((event, emit) {
      if (event.email == null || event.password == null) {
        emit(
            SignupformState(isSubmitting: false, showValidationMessages: true));
      } else {
        emit(
            SignupformState(isSubmitting: true, showValidationMessages: false));
        // TODO: trigger firebase authentication
      }
    });
  }
}
