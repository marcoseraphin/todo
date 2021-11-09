import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/injection.dart' as di;
import 'package:todo/presentation/routes/router.gr.dart' as r;
import 'package:todo/presentation/signup/signup_page.dart';
import 'package:todo/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = r.AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        title: 'ToDo App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark);
  }
}
