import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';
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
import 'MYPAGE.dart';
import 'usercollect.dart';

// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'dart:async';
import 'dart:io';


class EDITPAGE extends StatefulWidget {

  final Usercollect product;
  final DocumentSnapshot data;

  EDITPAGE({this.product, this.data});
  _EditPageState createState() => _EditPageState(product: product, data:data);

  }



class _EditPageState extends State<EDITPAGE> {
  final Usercollect product;
  final DocumentSnapshot data;
  _EditPageState({this.product, this.data});



  TextEditingController _English_name_edit = TextEditingController();
  TextEditingController _cellphone_edit = TextEditingController();
  TextEditingController _bank_edit = TextEditingController();
  TextEditingController _account_edit = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Widget titleSection =
    Column(children: <Widget>[
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
    product.student_id,
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
    product.name,
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
    product.Email,
    style: TextStyle(
    color: Colors.blueGrey,
    fontSize: 20.0,
    ),
    ),
    ],
    ),],),],);

    void sendData(BuildContext context){
      product.reference.update({'English_name': _English_name_edit.text});
      product.reference.update({'CellPhone': _cellphone_edit.text});
      product.reference.update({'BANK': _bank_edit.text});
      product.reference.update({'Accountnum': _account_edit.text});
    }


    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _English_name_edit,
              decoration: InputDecoration(
                hintText: '영어 이름 입력',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _cellphone_edit,
              decoration: InputDecoration(

                hintText: '핸드폰 번호 입력',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _bank_edit,
              decoration: InputDecoration(

                hintText: '계좌 은행 입력',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _account_edit,
              decoration: InputDecoration(

                hintText: '계좌 번호 입력',
              ),
            ),
            SizedBox(height: 50),
          ],
        )
    );


    return MaterialApp(
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
          title: Text("개인정보 수정", style: TextStyle(color: Colors.black),),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),


        ),
        body: ListView(
          children: <Widget>[
            titleSection,
            textSection,
            OutlineButton(
              onPressed: () {
                { sendData(context);}
              },
              child: Text('변경 하기'),
            ),
          ],
        ),
      ),
    );


  }
}