import 'package:day4/google_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Auth().signIn(context),
          child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 3.0,
                // we use double type it reduces the variable time required to access the value
                horizontal: 15.0,
              ),
              child: Text(
                "LOG IN",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orange,
                    width: 3.5,
                  ),
                  borderRadius: BorderRadius.circular(40))),
        ),
      ),
    );
  }
}
