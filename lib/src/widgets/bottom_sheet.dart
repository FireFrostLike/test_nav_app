import 'package:flutter/material.dart';
import 'package:test_nav_app/src/widgets/bottom_sheet_marker_info.dart';

class BottomInfoSheet extends StatelessWidget {
  const BottomInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color.fromARGB(255, 61, 90, 254);

    return Container(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: mainColor,
            radius: 35,
            child: CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage("lib/src/images/marker_avatar_placeholder.jpg"),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Илья",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BottomSheetMarkerInfo(
                      icon: Icons.wifi,
                      text: "GPS",
                    ),
                    SizedBox(width: 12),
                    BottomSheetMarkerInfo(
                      icon: Icons.calendar_today,
                      text: "02.07.17",
                    ),
                    SizedBox(width: 12),
                    BottomSheetMarkerInfo(
                      icon: Icons.query_builder,
                      text: "14:00",
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Посмотреть историю"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
