import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen();

  @override
  Widget build(BuildContext context) {
    return Text(
      "Video",
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }
}
