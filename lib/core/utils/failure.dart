import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);

  factory AuthFailure.fromFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return const AuthFailure('The password provided is too weak.');

      case 'email-already-in-use':
        return const AuthFailure('The account already exists for that email.');

      case 'user-not-found':
        return const AuthFailure('No user found for that email.');

      case 'wrong-password':
        return const AuthFailure('Wrong password provided.');

      case 'invalid-email':
        return const AuthFailure('The email address is not valid.');

      case 'network-request-failed':
        return const AuthFailure('No internet connection.');

      default:
        return const AuthFailure('Something went wrong. Please try again.');
    }
  }
}