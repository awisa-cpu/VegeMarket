import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/Controllers/auth/auth_state.dart';
import 'package:shopcart/Views/auth_views/sign_in.dart';
import 'package:shopcart/Views/auth_views/sign_up.dart';
import 'package:shopcart/Views/app_views/main_screen.dart';
import 'package:shopcart/utilities/displays/overlay_controller.dart';

class ViewDeterminator extends StatelessWidget {
  const ViewDeterminator({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationBloc>().add(AuthEventInitialize());

    //
    return BlocConsumer<AuthenticationBloc, AuthState>(
      builder: (context, state) {
        //
        if (state is AuthStateLoggedIn) {
          return const MainScreen();

          //
        } else if (state is AuthStateLoggedOut) {
          return const SignInView();

          //
        } else if (state is AuthStateHaveAccount) {
          return const SignInView();

          //
        } else if (state is AuthStateDontHaveAccount) {
          return const SignUpView();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is AuthStateLoggedOut) {
          if (state.isLoading == true) {
            OverLayController().showScreen(
                text: state.loadingText ?? 'Loading ...', context: context);
          } else {
            OverLayController().closeScreen();
          }
        }
      },
    );
  }
}
