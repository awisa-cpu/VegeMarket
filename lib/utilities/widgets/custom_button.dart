import 'package:flutter/material.dart';

typedef ButtonAction = void Function()?;

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.perform,
  }) : super(key: key);

  final ButtonAction perform;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: perform,
      child: Container(
        width: 130,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.amber.shade900,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
