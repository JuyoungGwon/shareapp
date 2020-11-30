import 'dart:ui';

import 'package:final_project/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:google_sign_in/google_sign_in.dart';


class PROFILE extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;

  Widget information(BuildContext context, User user) {
    if (user.uid != 'gs2sgRBkc0cI5rg7gnmXN2RFPHo2') {
      return Column(children: <Widget>[
        Image(
          image: NetworkImage('http://handong.edu/site/handong/res/img/logo.png'),
          width: 500,
          height: 300,
        ),
        Column(
          children: <Widget>[
            Text(
              user.uid,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 23.0,
              ),
            ),
            SizedBox(height: 30),
            const Divider(
              color: Colors.black,
              height: 1.0,
            ),
            SizedBox(height: 30),
            Text(
              'email : anonymous',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 23.0,
              ),
            ),
          ],
        ),
      ]);
    } else {
      return Column(children: <Widget>[
        Image(

          image: NetworkImage(user.photoURL),
          width: 500,
          height: 300,
        ),
        Column(
          children: <Widget>[
            Text(
              user.uid,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 23.0,
              ),
            ),
            SizedBox(height: 30),
            const Divider(
              color: Colors.black,
              height: 1.0,
            ),
            SizedBox(height: 30),
            Text(
              user.email,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 23.0,
              ),
            ),
          ],
        ),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Profile',
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  semanticLabel: 'Back Button',
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
            body: Container(
              child: information(context, user),
            )
        ));
  }
}

