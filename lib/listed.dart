import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task3/google_auth.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:task3/homepage.dart';

class Listed extends StatefulWidget {
  const Listed({super.key});
  @override
  State<StatefulWidget> createState() => _ListedState();
}

class _ListedState extends State<Listed> {
  @override
  Widget buildUser(User user) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 3.0,
            ),
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/Profile_Image.png"),
          ),
          // child: Text('${user.dob}')
          title: Text(
            user.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            'Interest:  ${user.interest} \n Profession: ${user.profession} \n Birthday: ${user.dob}',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          trailing: CircleAvatar(
            backgroundImage: AssetImage("assets/fire.png"),
          ),
          isThreeLine: true,
        ),
      ));
  Widget build(BuildContext context) {
    Stream<List<User>> readUsers() => FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
              // CircleAvatar(
              //     radius: 65,
              //     backgroundImage: ,
              //     ),
              // SizedBox(
              //   height: 16,
              // ),
            ],
          ),
          actions: [
            Text(
              "Log out:",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            IconButton(
                onPressed: () => Auth().signOut(context),
                icon: Icon(Icons.logout_outlined))
          ],
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
