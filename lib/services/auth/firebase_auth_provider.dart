import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopcart/models/auth_user.dart';
import 'package:shopcart/services/auth/auth_provider.dart';
import 'package:shopcart/utilities/Exceptions/firebase_auth_exceptions.dart';

class FirebaseAuthProvider implements AuthProvider {
  @override
  Future<void> forgotPassword() {
    throw UnimplementedError();
  }

  @override
  Future<void> initializeApp() {
    throw Exception();
  }

  @override
  Future<AuthUser?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final cUser = FirebaseAuth.instance.currentUser;
      if (cUser != null) {
        return AuthUser.fromFirebase(cUser);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException();
        case 'user-not-found':
          throw UserNotFoundException();
        case 'wrong-password':
          throw WrongPasswordException();
        case 'user-disabled':
          throw UserDisabledException();

        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logout() async {
    final loggedInUser = currentUser;

    if (loggedInUser != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedInException();
    }
  }

  @override
  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();
        case 'invalid-email':
          throw InvalidEmailException();
        case 'weak-password':
          throw WeakPasswordException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> verifyEmail() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw Exception('no user yet');
    }
  }

  @override
  AuthUser? get currentUser =>
      AuthUser.fromFirebase(FirebaseAuth.instance.currentUser!);
}
