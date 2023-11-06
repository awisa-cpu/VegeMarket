import 'package:flutter/material.dart';

typedef OnClick = void Function();

class BuyButton extends StatelessWidget {
  final String? text;
  final OnClick? onPressed;

  //
  const BuyButton({
    super.key,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(111, 207, 151, 1),
          borderRadius: BorderRadius.circular(20.5),
        ),
        child: Text(
          text ?? 'Buy now',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
