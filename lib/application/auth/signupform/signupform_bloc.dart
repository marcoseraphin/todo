import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/Failures/auth_failures.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  final AuthRepostory authRepostory;

  SignupformBloc({required this.authRepostory})
      : super(SignupformState(
            isSubmitting: false,
            showValidationMessages: false,
            authFailureOrSuccessOption: none())) {
    on<RegisterWithEMailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubmitting: false, showValidationMessages: true));
      } else {
        emit(SignupformState(
            isSubmitting: true,
            showValidationMessages: false,
            authFailureOrSuccessOption: none()));

        final failureOrSuccess =
            await authRepostory.registerWithEMailAndPassword(
                eMail: event.email!, password: event.password!);

        emit(state.copyWith(
            isSubmitting: false,
            showValidationMessages: false,
            authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }
    });

    on<SignInWithEMailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(SignupformState(
            isSubmitting: false,
            showValidationMessages: true,
            authFailureOrSuccessOption: none()));
      } else {
        emit(state.copyWith(isSubmitting: true, showValidationMessages: false));

        final failureOrSuccess = await authRepostory.signInWithEMailAndPassword(
            eMail: event.email!, password: event.password!);

        emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }
    });
  }
}
