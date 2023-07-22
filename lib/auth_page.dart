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
              child: Text("Commited to being single"),
            )),
      ),
    );
  }
}
