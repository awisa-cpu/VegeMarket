import 'package:flutter/material.dart';
import 'package:shopcart/utilities/routes/routes_constants.dart';

class EmailVerify extends StatelessWidget {
  const EmailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => goLoginPage(context),
            child: const Text('Go login page')),
      ),
    );
  }

  void goLoginPage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(loginPage, (route) => false);
  }
}
