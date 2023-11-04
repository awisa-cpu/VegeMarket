import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/product_controller/product_provider.dart';
import 'package:shopcart/services/auth/firebase_auth_provider.dart';
import 'package:shopcart/utilities/routes/route_generator.dart';

import 'Views/view_determinator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      //to provide access to auth provider
      create: (_) => AuthenticationBloc(provider: FirebaseAuthProvider()),

      //to provice access to the product provider
      child: ChangeNotifierProvider(
        create: (_) => ProductProvider(),

        //
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
      ),
    );
  }
}
