import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "FIRE",
        style: TextStyle(
          color: Colors.redAccent,
        ),
      )),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 3.0,
            // we use double type it reduces the variable time required to access the value
            horizontal: 15.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Text(
            "Welcome to Firebase",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
