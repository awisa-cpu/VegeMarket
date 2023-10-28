import 'package:shopcart/models/auth_user.dart';

abstract class AuthProvider{

  Future<void> initializeApp();

  Future<AuthUser?> signup({required String email, required String password});

  Future<AuthUser?> login({required String email, required String password});

  Future<void> logout();

  Future<void> forgotPassword({required String email});

  Future<void> verifyEmail();

  AuthUser? get currentUser;


}