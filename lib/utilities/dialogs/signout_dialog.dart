import 'package:flutter/material.dart';
import 'package:shopcart/utilities/dialogs/generic_dialog.dart';

Future<bool?> showSignOutDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  return showGenericDialog(
      context: context,
      title: title,
      content: content,
      options: {
        "Yes": true,
        "No": false,
      });
}
