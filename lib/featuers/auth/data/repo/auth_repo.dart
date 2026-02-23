import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_flow/core/utils/failure.dart';
import 'package:fit_flow/featuers/auth/data/services/firebase_auth_service.dart';



abstract class AuthRepo {
  Future<Either<Failure, Unit>> signUp(String email, String password);
  Future<Either<Failure, Unit>> signIn(String email, String password);
  Future<Either<Failure, Unit>> signOut();
}

class FirebaseAuthRepoImpl implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  FirebaseAuthRepoImpl({required FirebaseAuthService firebaseAuthService})
      : _firebaseAuthService = firebaseAuthService;

   @override
  Future<Either<Failure, Unit>> signUp(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuthService.signUp(email, password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseException(e));
    } catch (_) {
      return const Left(AuthFailure('Unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signIn(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuthService.signIn(email, password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.fromFirebaseException(e));
    } catch (_) {
      return const Left(AuthFailure('Unexpected error occurred.'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _firebaseAuthService.signOut();
      return right(unit);
    } catch (_) {
      return const Left(AuthFailure('Failed to sign out.'));
    }
  }
}
