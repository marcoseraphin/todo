part of 'signupform_bloc.dart';

@immutable
class SignupformState {
  final bool isSubmitting;
  final bool showValidationMessages;

  SignupformState(
      {required this.isSubmitting, required this.showValidationMessages});
}
