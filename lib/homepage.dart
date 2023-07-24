import 'package:day4/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final instance = FirebaseAuth.instance.currentUser;
    String? photo = instance!.photoURL;
    String? name = instance.displayName;
    String? email = instance.email;
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Base of Fire",
              style: TextStyle(
                color: Colors.redAccent,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundImage: NetworkImage(photo.toString()),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              '$name',
              style: const TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
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
