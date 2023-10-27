import 'package:shopcart/models/auth_user.dart';
import 'package:shopcart/services/auth/auth_provider.dart';
import 'package:shopcart/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService({required this.provider});

//this will always provide the firebase provider to us
  factory AuthService.fromFirebase() =>
      AuthService(provider: FirebaseAuthProvider());

  @override
  Future<void> forgotPassword() async => await provider.forgotPassword();

  @override
  Future<void> initializeApp() async => await provider.initializeApp();

  @override
  Future<AuthUser?> login({
    required String email,
    required String password,
  }) async =>
      await provider.login(email: email, password: password);

  @override
  Future<void> logout() async => await provider.logout();

  @override
  Future<void> signup({
    required String email,
    required String password,
  }) async =>
      await provider.signup(email: email, password: password);

  @override
  Future<void> verifyEmail() async => await  provider.verifyEmail();

  @override
  AuthUser? get currentUser => provider.currentUser;
}
