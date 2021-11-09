import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/core/Failures/auth_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todo/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepostory {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, Unit>> registerWithEMailAndPassword(
      {required String eMail, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: eMail, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(EMailAlreadyInUseFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEMailAndPassword(
      {required String eMail, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: eMail, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return left(InvalidEMailAndPasswordCombinationFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }
}
