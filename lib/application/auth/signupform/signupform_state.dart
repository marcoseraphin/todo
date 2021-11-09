part of 'signupform_bloc.dart';

@immutable
class SignupformState {
  final bool isSubmitting;
  final bool showValidationMessages;
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  const SignupformState(
      {required this.isSubmitting,
      required this.showValidationMessages,
      required this.authFailureOrSuccessOption});

  SignupformState copyWith(
      {bool? isSubmitting,
      bool? showValidationMessages,
      Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption}) {
    return SignupformState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      authFailureOrSuccessOption:
          authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
    );
  }
}
