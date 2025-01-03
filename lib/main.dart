import 'package:flutter/material.dart';
import 'package:myapp/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
            ),
          ),
          child: const StartScreen()
        ),
      ),
    ),
  );
}
