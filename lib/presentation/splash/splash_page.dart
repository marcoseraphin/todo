import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/auth/authbloc/auth_bloc.dart';
import 'package:todo/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          // navigate to Home
          context.router.replace(const HomePageRoute());
        } else if (state is AuthStateUnauthenticated) {
          // navigate to signin page
          context.router.replace(const SignUpPageRoute());
        }
      },
      child: Scaffold(
          body: Center(
        child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary),
      )),
    );
  }
}
