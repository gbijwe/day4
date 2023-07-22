import 'package:day4/google_auth.dart';
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to FIREBASE",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: InkWell(
                onTap: () => Auth().signOut(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3.0,
                    // we use double type it reduces the variable time required to access the value
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 3.5,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                  ),
                  child: const Text(
                    "LOG OUT",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
