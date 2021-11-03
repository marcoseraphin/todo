part of 'signupform_bloc.dart';

@immutable
class SignupformState {
  final bool isSubmitting;
  final bool showValidationMessages;

  SignupformState(
      {required this.isSubmitting, required this.showValidationMessages});

  SignupformState copyWith({
    bool? isSubmitting,
    bool? showValidationMessages,
  }) {
    return SignupformState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
    );
  }
}
