import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopcart/Controllers/auth/auth_bloc_controller.dart';
import 'package:shopcart/Controllers/auth/auth_event.dart';
import 'package:shopcart/Controllers/auth/auth_state.dart';
import 'package:shopcart/utilities/Exceptions/firebase_auth_exceptions.dart';
import 'package:shopcart/utilities/displays/snackbar.dart';

import '../../utilities/widgets/custom_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController _emailCon;
  late final TextEditingController _passwordCon;

  bool _showPassword = false;

  bool sendEmailNotification = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthStateLoggedOut) {
            log(state.exception.toString());
            if (state.exception is EmailAlreadyInUseException) {
              displaySnackBar(context: context, text: 'Email Already in use');

              //
            } else if (state.exception is InvalidEmailException) {
              displaySnackBar(context: context, text: 'Invalid Email');

              //
            } else if (state.exception is WeakPasswordException) {
              displaySnackBar(context: context, text: 'Weak Password');

              //
            } else if (state.exception is GenericAuthException) {
              displaySnackBar(context: context, text: 'Generic Auth Error');
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(14.5),
          child: Column(
            children: [
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
              const Text('Sign Up For Free'),

              //
              const SizedBox(
                height: 25.5,
              ),

              //email field
              TextFormField(
                controller: _emailCon,
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
                height: 20.5,
              ),

              //password field
              TextField(
                controller: _passwordCon,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.5),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.5),
                    ),
                  ),
                ),
              ),

              //
              const SizedBox(
                height: 10.5,
              ),

              //
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    value: sendEmailNotification,
                    splashRadius: 0.4,
                    onChanged: (value) {
                      setState(() {
                        sendEmailNotification = value!;
                      });
                    },
                  ),
                  const Text('Email Me About Special Pricing')
                ],
              ),
              //
              const SizedBox(
                height: 25.5,
              ),

              //create account

              CustomButton(
                text: 'Create Account',
                perform: () {
                  final email = _emailCon.text;
                  final password = _passwordCon.text;

                  context
                      .read<AuthenticationBloc>()
                      .add(AuthEventSignup(email: email, password: password));
                },
              ),

              //
              const SizedBox(
                height: 23,
              ),

              //have account?
              TextButton(
                  onPressed: () {
                    context
                        .read<AuthenticationBloc>()
                        .add(AuthEventHaveAccount());
                  },
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.amber.shade900),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
