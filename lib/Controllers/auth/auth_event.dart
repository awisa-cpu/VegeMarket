abstract class AuthEvent {}

class AuthEventSignIn extends AuthEvent {
  final String email;
  final String password;

  AuthEventSignIn({
    required this.email,
    required this.password,
  });
}

class AuthEventSignOut extends AuthEvent {}

class AuthEventSignup extends AuthEvent {
  final String email;
  final String password;

  AuthEventSignup({
    required this.email,
    required this.password,
  });
}


class AuthEventHaveAccount extends AuthEvent{}

class AuthEventDontHaveAccount extends AuthEvent{}
class AuthEventInitialize extends AuthEvent {}

class AuthEventEmailVerify extends AuthEvent {}

class AuthEventPasswordForget extends AuthEvent {}
