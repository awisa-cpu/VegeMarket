
abstract class AuthState {
  bool? isLoading;
  Exception? exception;

  AuthState({required this.isLoading, this.exception});
}

class AuthStateInitialize extends AuthState {
  AuthStateInitialize({
    required bool loading,
  }) : super(
          isLoading: loading,
          exception: null,
        );
}

class AuthStateLoggedOut extends AuthState {
  String? loadingText;
  AuthStateLoggedOut({
    required bool loading,
    Exception? exception,
    this.loadingText,
  }) : super(
          isLoading: loading,
          exception: exception,
        );
}

class AuthStateLoggedIn extends AuthState {

  // final AuthUser user;
  AuthStateLoggedIn({
    // required this.user,
    bool? loading,
  }) : super(
          isLoading: loading,
          exception: null,
        );
}

class AuthStateVerifyEmail extends AuthState {
  AuthStateVerifyEmail({bool? loading, Exception? exception})
      : super(isLoading: loading, exception: exception);
}

class AuthStateHaveAccount extends AuthState {
  AuthStateHaveAccount({bool? loading, Exception? exception})
      : super(
          isLoading: loading,
          exception: exception,
        );
}

class AuthStateDontHaveAccount extends AuthState {
  AuthStateDontHaveAccount({bool? loading, Exception? exception})
      : super(
          isLoading: loading,
          exception: exception,
        );
}
