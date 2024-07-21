import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String imageName;
  final double? scale;
  final Function onTap;

  const NavigationButton(
      {super.key,
      required this.imageName,
      this.scale = 3,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Image.asset(
        imageName,
        scale: scale,
      ),
    );
  }
}