import 'package:flutter/material.dart';

Future<Object?> showGenericDialog<Object>({
  required BuildContext context,
  required String title,
  required String content,
  required Map<String, Object?> options,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: options.keys.map((e) {
          final value = options[e];

          return TextButton(
            onPressed: () {
              if (value != null) {
                Navigator.of(context).pop(value);
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(e),
          );
        }).toList(),
      );
    },
  );
}
