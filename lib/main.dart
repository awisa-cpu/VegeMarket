import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/Controllers/auth/auth_state.dart';
import 'package:shopcart/Controllers/product_controller/product_controller.dart';
import 'package:shopcart/Views/auth_views/sign_in.dart';
import 'package:shopcart/Views/auth_views/sign_up.dart';
import 'package:shopcart/Views/product_views/home_product.dart';
import 'package:shopcart/services/auth/firebase_auth_provider.dart';
import 'package:shopcart/utilities/routes/route_generator.dart';
import 'package:shopcart/utilities/displays/snackbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(provider: FirebaseAuthProvider()),
      child: MaterialApp(
        onGenerateRoute: (settings) => generateRoute(settings),
        title: 'Vege Market',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber.shade900),
          useMaterial3: true,
        ),
        home: const ViewDeterminator(),
      ),
    );
  }
}

class ViewDeterminator extends StatelessWidget {
  const ViewDeterminator({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthEventInitialize());

    //
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        //
        if (state is AuthStateLoggedIn) {
          return ChangeNotifierProvider(
            create: (context) => ProductProvider(),
            child: const HomeProduct(),
            
          );

          //
        } else if (state is AuthStateLoggedOut) {
          return const SignInView();

          //
        } else if (state is AuthStateHaveAccount) {
          return const SignInView();
        } else if (state is AuthStateDontHaveAccount) {
          return const SignUpView();
        } else {
          return const Scaffold(
            body: Center(
              child: Text('State problem'),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is AuthStateLoggedOut) {
          if (state.isLoading == true) {
            displaySnackBar(context: context, text: 'loading ....');
          }
        }
      },
    );
  }
}
