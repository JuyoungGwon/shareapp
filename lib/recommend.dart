import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("추 천", style: TextStyle(color: Colors.black),),
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          )

      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              "오늘의 메뉴 추천",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,

              ),

            ),

          ),
          SizedBox(height: 20.0),
          buildRoomList(),
          buildTitleRow(),
          buildProductList(),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  buildRoomList() {
    return Container(
      height: 275,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures[index];
          return RoomItem(
            furniture: furniture,
          );
        },
      ),
    );
  }

  buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Popular Products",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  buildProductList() {
    return Container(
      height: 140.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,


        itemBuilder: (BuildContext context, int index) {
          Map furniture1 = hi[index];

          return ProductItem(
            hi: furniture1,
          );
        },



      ),
    );
  }
}


List furnitures = [
  {
    "name": "굽네치킨 고추바사삭",
    "img": "assets/gochubasasak.png",
  },
  {
    "name": "미스터 피자 치즈&뉴욕 스트립",
    "img": "assets/cheesenew.png",
  },
  {
    "name": "포메인 쌀국수",
    "img": "assets/main.png",
  },
  {
    "name": "원할머니 보쌈",
    "img": "assets/onegrandma.png",
  },
];


List hi = [
  {
    "name": "신전 떡볶이",
    "img": "assets/sinjeon.png",
  },
  {
    "name": "두마리 찜닭",
    "img": "assets/doomari.png",
  },
  {
    "name": "고기듬뿍비빔밥",
    "img": "assets/gogi.png",
  },
  {
    "name": "석쇠 불고기",
    "img": "assets/suksi.png",
  },
];




class RoomItem extends StatelessWidget {
  final Map furniture;

  RoomItem({this.furniture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),

        child: Container(
          height: 220,
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                furniture['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "${furniture["img"]}",
                  height: 200,
                  width: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );

  }
}




class ProductItem extends StatelessWidget {
  final Map hi;
  ProductItem({this.hi});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),

        child: Container(
          height: 100,
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                hi['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "${hi["img"]}",
                  height: 110,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );

  }
}
