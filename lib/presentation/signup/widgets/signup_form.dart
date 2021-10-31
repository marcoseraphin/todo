import 'package:flutter/material.dart';
import 'package:todo/presentation/signup/widgets/signin_register_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String? validateEMail(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

      if (input == null || input.isEmpty) {
        return "please enter eMail address";
      } else if (RegExp(emailRegex).hasMatch(input)) {
        return null;
      } else {
        return "invalid eMail format";
      }
    }

    String? validatePassword(String? input) {
      if (input == null || input.isEmpty) {
        return "please enter eMail password";
      } else if (input.length >= 6) {
        return null;
      } else {
        return "to short password";
      }
    }

    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 80),
          Text(
            "Welcome",
            style: themeData.textTheme.headline1!.copyWith(
                fontSize: 50, fontWeight: FontWeight.w500, letterSpacing: 4),
          ),
          const SizedBox(height: 20),
          Text(
            "Please register oder sign in",
            style: themeData.textTheme.headline1!.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 4),
          ),
          const SizedBox(height: 80),
          TextFormField(
              autovalidateMode: AutovalidateMode.disabled,
              cursorColor: Colors.white,
              decoration: const InputDecoration(labelText: "E-Mail"),
              validator: validateEMail),
          const SizedBox(height: 20),
          TextFormField(
              autovalidateMode: AutovalidateMode.disabled,
              cursorColor: Colors.white,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
              validator: validatePassword),
          const SizedBox(height: 40),
          SignInRegisterButton(
              buttonText: "Sign in",
              callback: () {
                print("sign in pressed");
                if (formKey.currentState!.validate()) {
                  print("validated");
                } else {
                  print("unvalid");
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
              // ignore: avoid_print
              print("register pressed");
            },
          )
        ],
      ),
    );
  }
}
