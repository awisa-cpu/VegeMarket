import 'package:flutter/material.dart';

void displaySnackBar({
  required BuildContext context,
  required String text,
}) {
  final snackbar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.amber.shade800,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
