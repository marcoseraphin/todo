part of 'signupform_bloc.dart';

@immutable
abstract class SignupformEvent {}

class RegisterWithEMailAndPasswordPressed extends SignupformEvent {
  final String? email;
  final String? password;

  RegisterWithEMailAndPasswordPressed(
      {required this.email, required this.password});
}

class SignInWithEMailAndPasswordPressed extends SignupformEvent {
  final String? email;
  final String? password;

  SignInWithEMailAndPasswordPressed(
      {required this.email, required this.password});
}
