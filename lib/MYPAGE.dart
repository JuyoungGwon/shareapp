import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
import 'EDIT.dart';
import 'LOGINPAGE.dart';
import 'usercollect.dart';
import 'package:final_project/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:final_project/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';








class PROFILE extends StatefulWidget {
  @override
  _PROFILE createState() {
    return _PROFILE();
  }
}

class _PROFILE extends State<PROFILE> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  TextEditingController controller1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Profile',
        home: Scaffold(
            appBar: AppBar(

              backgroundColor: Colors.white,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    semanticLabel: 'Back Button',
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PROFILE()));
                  }
              ),
              title: Text("My Page", style: TextStyle(color: Colors.black),),
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.black,
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
              child: _buildBody(context),
            )
        ));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('userstore').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Usercollect.fromSnapshot(data);

    return Column(children: <Widget>[
      SizedBox(height: 60),
      Column(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주 축 기준 중앙
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '    학번 :          ',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),

              Text(
                record.student_id,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),



          SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주 축 기준 중앙
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '    이름 :          ',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),

              Text(
                record.name,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),

          SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주 축 기준 중앙
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '    Email :        ',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),

              Text(
                record.Email,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주 축 기준 중앙
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '    영어 이름 :  ',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),

              Text(
                record.English_name,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주 축 기준 중앙
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '    휴대폰 번호 :  ',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),

              Text(
                record.CellPhone,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주 축 기준 중앙
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '    등록 은행 :  ',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),

              Text(
                record.BANK,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // 주 축 기준 중앙
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '    계좌 번호 :  ',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),

              Text(
                record.Accountnum,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          OutlineButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EDITPAGE(product:record, data: data)));
              print(user.metadata);
              print(user.providerData);
              print(user.tenantId);
              print(user.phoneNumber);
              print(user.displayName);
              print(user.email);
              print(user.emailVerified);
              print(user.photoURL);
              print(user.refreshToken);
              print(user.uid);
              print(user.hashCode);
              print(user.runtimeType);
            },
            child: Text('개인정보 수정'),
          ),

        ],
      ),
    ]);
  }
}
