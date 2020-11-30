import 'dart:math';
import 'package:flutter/material.dart';
import 'Gridmodel.dart';
import 'LOGINPAGE.dart';
import 'MYPAGE.dart';
import 'hansikchatpage.dart';
import 'menu.dart';
class Paytm extends StatefulWidget {
  @override
  _PaytmState createState() => _PaytmState();
}

class _PaytmState extends State<Paytm> {
    int _selectedIndex = 0;
    List<Widget> _widgetOptions = <Widget>[
      Paytm1(),
      LoginPage(),
      PROFILE(),
      PROFILE(),
    ];
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        //appBar:  AppBar(
         //   backgroundColor: Colors.white,
          //  title: Text("HOME", style: TextStyle(color: Colors.black),),
           // elevation: 0,
           // centerTitle: true,
           // iconTheme: IconThemeData(
           //   color: Colors.black,
          //  )

       // ),
        body:  _widgetOptions.elementAt(_selectedIndex),

        bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/home.png",
                  width: 24.0,
                  height: 24.0,
                ),
                title: Text(
                  '홈',
                )),

            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/shopping-bagg.png",
                  width: 24.0,
                  height: 24.0,
                ),
                title: Text(
                  '참여 내역',
                )),

            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bank.png",
                  width: 24.0,
                  height: 24.0,
                ),
                title: Text(
                  '추천',
                )),

            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/delivery.png",
                  width: 24.0,
                  height: 24.0,
                ),
                title: Text(
                  'MY',
                )),



          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red[200],
          onTap: _onItemTapped,

        ),
      );

    }
  }

