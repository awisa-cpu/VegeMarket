import 'package:flutter/material.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 110,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(111, 207, 151, 1),
        borderRadius: BorderRadius.circular(20.5),
      ),
      child: const Text(
        'Buy now',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
