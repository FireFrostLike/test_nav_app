import 'package:flutter/material.dart';

import 'package:test_nav_app/src/screens/map_screen.dart';

void main() {
  runApp(const TestNavApp());
}

class TestNavApp extends StatelessWidget {
  const TestNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MapScreen(),
    );
  }
}
