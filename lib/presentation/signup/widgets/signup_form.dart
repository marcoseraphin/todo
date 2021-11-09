import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/signupform/signupform_bloc.dart';
import 'package:todo/core/Failures/auth_failures.dart';
import 'package:todo/presentation/routes/router.gr.dart';
import 'package:todo/presentation/signup/widgets/signin_register_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String _eMail;
    late String _password;

    final themeData = Theme.of(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? validateEMail(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (input == null || input.isEmpty) {
        return "please enter eMail address";
      } else if (RegExp(emailRegex).hasMatch(input)) {
        _eMail = input;
        return null;
      } else {
        return "invalid eMail format";
      }
    }

    String? validatePassword(String? input) {
      if (input == null || input.isEmpty) {
        return "please enter eMail password";
      } else if (input.length >= 6) {
        _password = input;
        return null;
      } else {
        return "to short password";
      }
    }

    String mapFailureMessage(AuthFailure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return "something went wrong";
        case EMailAlreadyInUseFailure:
          return "eMail already in use";
        case InvalidEMailAndPasswordCombinationFailure:
          return "invalid eMail and passwod combination";

        default:
          return "something went wrong";
      }
    }

    return BlocConsumer<SignupformBloc, SignupformState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () => {},
            (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold((failure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(mapFailureMessage(failure),
                        style: themeData.textTheme.bodyText1),
                    backgroundColor: Colors.redAccent,
                  ));
                }, (_) {
                  AutoRouter.of(context).push(const HomePageRoute());
                }));
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showValidationMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 80),
              Text(
                "Welcome",
                style: themeData.textTheme.headline1!.copyWith(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4),
              ),
              const SizedBox(height: 20),
              Text(
                "Please register oder sign in",
                style: themeData.textTheme.headline1!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4),
              ),
              const SizedBox(height: 80),
              TextFormField(
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(labelText: "E-Mail"),
                  validator: validateEMail),
              const SizedBox(height: 20),
              TextFormField(
                  cursorColor: Colors.white,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: validatePassword),
              const SizedBox(height: 40),
              SignInRegisterButton(
                  buttonText: "Sign in",
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<SignupformBloc>(context).add(
                          SignInWithEMailAndPasswordPressed(
                              email: _eMail, password: _password));
                    } else {
                      BlocProvider.of<SignupformBloc>(context).add(
                          SignInWithEMailAndPasswordPressed(
                              email: null, password: null));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Invalid Input",
                            style: themeData.textTheme.bodyText1),
                        backgroundColor: Colors.redAccent,
                      ));
                    }
                  }),
              const SizedBox(height: 20),
              SignInRegisterButton(
                buttonText: "Register",
                callback: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SignupformBloc>(context).add(
                        RegisterWithEMailAndPasswordPressed(
                            email: _eMail, password: _password));
                  } else {
                    BlocProvider.of<SignupformBloc>(context).add(
                        RegisterWithEMailAndPasswordPressed(
                            email: null, password: null));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Invalid Input",
                          style: themeData.textTheme.bodyText1),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 10),
                LinearProgressIndicator(color: themeData.colorScheme.secondary)
              ]
            ],
          ),
        );
      },
    );
  }
}
