import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String uid;
   String? displayName;
  final String email;
  final bool isEmailVerified;


  AuthUser._private({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.isEmailVerified,
  });

  factory AuthUser.fromFirebase(User user) => AuthUser._private(
      uid: user.uid,
      displayName: user.displayName,
      email: user.email!,
      isEmailVerified: user.emailVerified);
}
