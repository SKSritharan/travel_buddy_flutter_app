import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Buddy',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Travel Buddy!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
      ),
    );
  }
}