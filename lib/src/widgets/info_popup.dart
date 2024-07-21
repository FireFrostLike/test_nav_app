import 'package:flutter/material.dart';

class InfoPopup extends StatelessWidget {
  const InfoPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 45,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Илья",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("GPS, 14:00")
          ],
        ),
      ),
    );
  }
}
