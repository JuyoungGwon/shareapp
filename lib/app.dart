import 'package:final_project/Gridmodel.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'Gridmodel.dart';
import 'EDIT.dart';
import 'home.dart';
import 'LOGINPAGE.dart';
import 'hansikchatpage.dart';
import 'MYPAGE.dart';
//import 'LOGINPAGE.dart';
//import 'ADDPRODUCT.dart';
//import 'DETAIL.dart';
//import 'PROFILE.dart';
import 'recommend.dart';
// TODO: Convert ShrineApp to stateful widget (104)
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: Paytm(),
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      routes: {
   //     '/login': (context) => LoginPage(),
        '/home': (context) => Paytm(),
        'hansikchat' : (context) => hansikchat(),
        'MYPAGE' : (context) => PROFILE(),
        'menu' : (context) => Paytm1(),
        'EDIT' : (context) => EDITPAGE(),
        'recommend' : (context) => Home(),
     //   '/add': (context) => ADDPRODUCTPAGE(),
      //  '/homepagedetail': (context) => DETAILPAGE(),
     //   '/profile': (context) => PROFILE(),
      },
      // TODO: Add a theme (103)
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}


// TODO: Build a Shrine Theme (103)
// TODO: Build a Shrine Text Theme (103)