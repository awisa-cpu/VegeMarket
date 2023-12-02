import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/Controllers/auth/auth_state.dart';
import 'package:shopcart/utilities/Exceptions/firebase_auth_exceptions.dart';
import 'package:shopcart/utilities/displays/snackbar.dart';

import '../../utilities/widgets/custom_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final TextEditingController _emailCon;
  late final TextEditingController _passwordCon;
  bool _showPassword = true;
  bool keepSignedIn = true;

  @override
  void initState() {
    super.initState();
    _emailCon = TextEditingController();
    _passwordCon = TextEditingController();
  }

  @override
  void dispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateLoggedOut) {
            //rework on the exceptions
            log(state.exception.toString());
            if (state.exception is InvalidEmailException) {
              displaySnackBar(context: context, text: 'Invalid Email');

              //
            } else if (state.exception is UserNotFoundException) {
              displaySnackBar(context: context, text: 'User Not Found');

              //
            } else if (state.exception is WrongPasswordException) {
              displaySnackBar(context: context, text: 'Wrong Password');

              //
            } else if (state.exception is UserDisabledException) {
              displaySnackBar(context: context, text: 'User has been diabled ');

              //
            } else if (state.exception is InvalidLoginCredentialsException) {
              displaySnackBar(context: context, text: 'Invalid Details');

              //
            } else if (state.exception is GenericAuthException) {
              displaySnackBar(context: context, text: 'Generic Auth Error');
            }
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.5),
            child: Column(
              children: [
                //
                const SizedBox(
                  height: 60.5,
                ),

                //display image
                CircleAvatar(
                  radius: 80.2,
                  child: Image.asset(
                    'lib/images/display.png',
                  ),
                ),

                //message
                const Text('Login To Your Account'),

                //
                const SizedBox(
                  height: 25.5,
                ),

                //email field
                TextField(
                  controller: _emailCon,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.5),
                      ),
                    ),
                  ),
                ),
                //
                const SizedBox(
                  height: 15.5,
                ),

                //password field
                TextField(
                  controller: _passwordCon,
                  obscureText: _showPassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: 'Password',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10.5),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.5),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _showPassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                //optionals
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      value: keepSignedIn,
                      splashRadius: 0.4,
                      onChanged: (value) {
                        setState(() {
                          keepSignedIn = value!;
                        });
                      },
                    ),
                    const Text('Keep Me Signed In')
                  ],
                ),

                //
                const SizedBox(
                  height: 20.5,
                ),
                const Text('Or Continue With'),

                const SizedBox(
                  height: 10.5,
                ),

                //other sign in options
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 1.0,
                      child: Container(
                        width: 130,
                        height: 50,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'lib/images/facebook.png',
                              width: 20.5,
                              height: 20.5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Facebook ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //
                    const SizedBox(
                      width: 18,
                    ),

                    //
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 1.0,
                      child: Container(
                        width: 130,
                        height: 50,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'lib/images/google.jpg',
                              width: 22.5,
                              height: 22.5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Google ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                //
                const SizedBox(
                  height: 15.5,
                ),
                Text(
                  'Forgot Your Password?',
                  style: TextStyle(color: Colors.amber.shade900),
                ),

                const SizedBox(
                  height: 10.5,
                ),

                //login button
                CustomButton(
                  text: 'Login',
                  perform: () {
                    final email = _emailCon.text;
                    final password = _passwordCon.text;

                    context
                        .read<AuthenticationBloc>()
                        .add(AuthEventSignIn(email: email, password: password));
                  },
                ),

                const SizedBox(
                  height: 15.4,
                ),

                //
                TextButton(
                    onPressed: () {
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthEventDontHaveAccount());
                    },
                    child: Text(
                      'No Account? Create Account',
                      style: TextStyle(color: Colors.amber.shade900),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
