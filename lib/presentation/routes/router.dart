import 'package:auto_route/auto_route.dart';
import 'package:todo/presentation/home/home_page.dart';
import 'package:todo/presentation/signup/signup_page.dart';
import 'package:todo/presentation/splash/splash_page.dart';

// To create dyanmic route file run this command in the terminal:
// => flutter packages pub run build_runner build
@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(page: SignUpPage, initial: false),
  AutoRoute(page: HomePage, initial: false)
])
class $AppRouter {}
