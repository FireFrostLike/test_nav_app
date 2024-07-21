import 'package:flutter/material.dart';

class BottomSheetMarkerInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const BottomSheetMarkerInfo(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color.fromARGB(255, 61, 90, 254);

    return Row(
      children: [
        Icon(
          icon,
          size: 15,
          color: mainColor,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
