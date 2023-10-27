import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController _emailCon;
  late final TextEditingController _passwordCon;
  late final TextEditingController _fullName;

  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailCon = TextEditingController();
    _passwordCon = TextEditingController();
    _fullName = TextEditingController();
  }

  @override
  void dispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
    _fullName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.5),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            //message
            const Text('Sign Up For Free'),

            //
            const SizedBox(
              height: 25.5,
            ),

            //name field
            TextField(
              controller: _fullName,
              decoration: const InputDecoration(
                hintText: 'Full Name',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.5),
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
            ),

            const SizedBox(
              height: 20.5,
            ),

            //email field
            TextField(
              controller: _emailCon,
              decoration: const InputDecoration(
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
          ],
        ),
      ),
    );
  }
}
