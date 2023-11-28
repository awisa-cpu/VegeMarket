
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/Controllers/auth/auth_state.dart';
import 'package:shopcart/services/auth/auth_provider.dart';


//Responsibility: Handle authentication services
class AuthenticationBloc extends Bloc<AuthEvent, AuthState> {
  final AuthProvider provider;

  AuthenticationBloc({required this.provider})
      : super(AuthStateInitialize(loading: false)) {
    //app initailization
    on<AuthEventInitialize>((event, emit) async {
      try {
        await provider.initializeApp();
        final user = provider.currentUser;
        if (user != null) {
          emit(AuthStateLoggedIn());
        } else {
          emit(AuthStateLoggedOut(loading: false));
        }
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(loading: false, exception: e));
      }
    });

    //create account
    on<AuthEventSignup>((event, emit) async {
      emit(AuthStateLoggedOut(loading: true, exception: null));

      try {
        final email = event.email;
        final password = event.password;

        await provider.signup(email: email, password: password);
        await provider.verifyEmail();
        emit(AuthStateLoggedOut(loading: false, exception: null));
        // emit(AuthStateLoggedIn());
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(loading: false, exception: e));
      }
    });

    //signin event
    on<AuthEventSignIn>((event, emit) async {
      emit(AuthStateLoggedOut(
        loading: true,
        exception: null,
        loadingText: 'Please wait while i log you in',
      ));

      try {
        final email = event.email;
        final password = event.password;

        await provider.login(email: email, password: password);
        emit(AuthStateLoggedOut(loading: false, exception: null));
        emit(AuthStateLoggedIn());
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(loading: false, exception: e));
      }
    });

    //sign out event
    on<AuthEventSignOut>((event, emit) async {
      try {
        await provider.logout();
        emit(AuthStateLoggedOut(loading: false));
      } on Exception catch (e) {
        emit(AuthStateLoggedOut(loading: false, exception: e));
      }
    });

    on<AuthEventHaveAccount>((event, emit) => emit(AuthStateHaveAccount()));

    on<AuthEventDontHaveAccount>(
        (event, emit) => emit(AuthStateDontHaveAccount()));

    //verify email
    on<AuthEventEmailVerify>((event, emit) => null);

    //password forget
    on<AuthEventPasswordForget>((event, emit) => null);
  }
}
