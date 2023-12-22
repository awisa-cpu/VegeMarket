import 'package:flutter/material.dart';

class ContainerDeco extends StatelessWidget {
  const ContainerDeco({
    required this.icon,
    super.key,
  });
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }
}
