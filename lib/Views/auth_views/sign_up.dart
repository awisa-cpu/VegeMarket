import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController _emailCon;
  late final TextEditingController _passwordCon;
  bool _showPassword = false;

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
      body: Padding(
        padding: const EdgeInsets.all(14.5),
        child: Column(
          children: [
            //message
            const Text('Sign Up For Free'),

            //
            const SizedBox(
              height: 25.5,
            ),

            //email field
            TextField(
              controller: _emailCon,
              decoration: InputDecoration(
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
                hintText: 'Email',
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.5),
              ),
            ),
            //
            const SizedBox(
              height: 15.5,
            ),

            //password field
            TextField(
              controller: _passwordCon,
              decoration: const InputDecoration(
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
