// ignore: implementation_imports
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
      listener: (context, state) async {
        if (state is AuthStateAuthenticated) {
          // navigate to Home
          await Future.delayed(const Duration(seconds: 3));
          context.router.replace(const HomePageRoute());
        } else if (state is AuthStateUnauthenticated) {
          // navigate to signin page
          await Future.delayed(const Duration(seconds: 3));
          context.router.replace(const SignUpPageRoute());
        }
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Icon(
              Icons.people,
              size: 100.0,
            ),
            Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      )),
    );
  }
}
