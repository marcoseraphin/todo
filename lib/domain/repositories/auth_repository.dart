import 'package:dartz/dartz.dart';
import 'package:todo/core/Failures/auth_failures.dart';

abstract class AuthRepostory {
  Future<Either<AuthFailure, Unit>> registerWithEMailAndPassword(
      {required String eMail, required String password});

  Future<Either<AuthFailure, Unit>> signInWithEMailAndPassword(
      {required String eMail, required String password});
}
