import 'dart:ffi';
import 'package:task3/listed.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task3/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class User {
  String id;
  final String name;
  final String profession;
  final String interest;
  final int dob;
  User({
    this.id = '',
    required this.name,
    required this.profession,
    required this.interest,
    required this.dob,
  });

  Map<String, dynamic> toJSON() => {
        'id': id,
        'name': name,
        'profession': profession,
        'interest': interest,
        'dob': dob,
      };
  static User fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      profession: json['profession'],
      interest: json['interest'],
      dob: json['dob']);
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final instance = FirebaseAuth.instance.currentUser;
    String? photo = instance!.photoURL;
    // String? name = instance.displayName;
    // String? email = instance.email;
    Future createUser(
        {required String name,
        required String profession,
        required String interest,
        required int dob}) async {
      final docUser = FirebaseFirestore.instance.collection('users').doc();
      final user = User(
        id: docUser.id,
        name: name,
        profession: profession,
        interest: interest,
        dob: dob,
      );

      final json = user.toJSON();
      await docUser.set(json);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Flutter ",
                  style: TextStyle(
                    color: Colors.orange,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  "Commune ",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              // radius: 65,
              backgroundImage: NetworkImage(photo.toString()),
            ),
            // SizedBox(
            //   height: 16,
            // ),
          ],
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {},
        //   )
        // ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //
              // FutureBuilder<List<User>>()
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      //name
                      controller: controller,
                      decoration: (InputDecoration(
                        hintText: "Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.orangeAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      //profession
                      controller: controller2,
                      decoration: InputDecoration(
                        hintText: "Profession",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.orangeAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      // interest
                      controller: controller3,
                      decoration: InputDecoration(
                        hintText: "Interest",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.orangeAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextField(
                      // interest
                      controller: controller4,
                      decoration: InputDecoration(
                        hintText: "Birthday",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.orangeAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // DateTimeField(
                    //     controller: controller4,
                    //     decoration: InputDecoration(
                    //       hintText: "Birthday",
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             width: 1.5,
                    //             color: Colors.orangeAccent), //<-- SEE HERE
                    //         borderRadius: BorderRadius.circular(50.0),
                    //       ),
                    //     ),
                    //     format: DateFormat('dd-MM-yyyy'),
                    //     onShowPicker: (context, currentValue) => (
                    //           context: context,
                    //           firstdate: DateTime(1900),
                    //           lastDate: DateTime(2100),
                    //           initialDate: currentValue ?? DateTime.now()
                    //         )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    final name = controller.text;
                    final prof = controller2.text;
                    final intr = controller3.text;
                    final date = int.parse(controller4.text);
                    createUser(
                        name: name,
                        profession: prof,
                        interest: intr,
                        dob: date);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Listed()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurple,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Add user",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Text(
              //   '$name',
              //   style: const TextStyle(
              //       fontSize: 30,
              //       fontStyle: FontStyle.normal,
              //       color: Colors.white),
              // ),
              // const SizedBox(height: 8),
              // Text(
              //   'Email: $email',
              //   style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              // ),
              // const SizedBox(height: 16),

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15.0),
              //   child: InkWell(
              //     onTap: () => Auth().signOut(context),
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(
              //         vertical: 3.0,
              //         // we use double type it reduces the variable time required to access the value
              //         horizontal: 15.0,
              //       ),
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Colors.orange,
              //           width: 3.5,
              //         ),
              //         borderRadius: BorderRadius.circular(50.0),
              //         color: Colors.white,
              //       ),
              //       child: const Text(
              //         "LOG OUT",
              //         style: TextStyle(
              //           fontSize: 25.0,
              //           color: Colors.black,
              //           fontStyle: FontStyle.italic,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
