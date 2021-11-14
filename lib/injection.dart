import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/application/auth/authbloc/auth_bloc.dart';
import 'package:todo/application/auth/signupform/signupform_bloc.dart';
import 'package:todo/domain/repositories/auth_repository.dart';
import 'package:todo/infrastructure/repositories/auth_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! state management
  sl.registerFactory(() => SignupformBloc(authRepostory: sl()));
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  //! repos
  sl.registerLazySingleton<AuthRepostory>(
      () => AuthRepositoryImpl(firebaseAuth: sl()));

  //! external
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
}
