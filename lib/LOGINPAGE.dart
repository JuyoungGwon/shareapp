// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:final_project/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


final FirebaseAuth _auth = FirebaseAuth.instance;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/asset1.jpg', height: 330,
                  width: 300,),
                //height: 150,
                //SizedBox(height: 2.0),
              ],

            ),
            SizedBox(height: 30.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            Column(
              children: <Widget>[
                _OtherProvidersSignInSection(),
                //SizedBox(height: 16.0),
              ],
            ),
            SizedBox(height: 12.0),
            // TODO: Wrap Password with AccentColorOverride (103)

          ],
        ),
      ),
    );
  }
}

class _AnonymouslySignInSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnonymouslySignInSectionState();
}

class _AnonymouslySignInSectionState extends State<_AnonymouslySignInSection> {
  bool _CHECK;
  String _USERID;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 0.0),
                  alignment: Alignment.center,
                  child: SignInButtonBuilder(
                    text: "Guest",
                    icon: Icons.person_outline,
                    backgroundColor: Colors.grey,
                    onPressed: () async {
                      _signInAnonymously();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Paytm()),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: _CHECK == null ? false : true,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _CHECK == null
                          ? ''
                          : (_CHECK
                          ? 'Successfully signed in, uid: ' + _USERID
                          : 'Sign in failed'),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            )));
  }

  // Example code of how to sign in anonymously.
  void _signInAnonymously() async {
    try {
      final User user = (await _auth.signInAnonymously()).user;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Signed in Anonymously as user ${user.uid}"),
      ));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in Anonymously"),
      ));
    }
  }
}

class _OtherProvidersSignInSection extends StatefulWidget {
  _OtherProvidersSignInSection();

  @override
  State<StatefulWidget> createState() => _OtherProvidersSignInSectionState();
}

class _OtherProvidersSignInSectionState
    extends State<_OtherProvidersSignInSection> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.all(0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                child: RaisedButton(
                  color: Colors.red[200],
                  child: Text(
                    "SIGN IN WITH GOOGLE ACCOUNT",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    _signInWithGoogle();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Paytm()),
                    );
                  },
                ),
              ),





           //   ),
            ],
          )),
    );
  }

  //Example code of how to sign in with Google.
  void _signInWithGoogle() async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final GoogleAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Sign In ${user.uid} with Google"),
      ));
    } catch (e) {
      print(e);

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Google: ${e}"),
      ));
    }
  }
}


// TODO: Add AccentColorOverride (103)
