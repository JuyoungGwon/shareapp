import 'dart:math';
import 'package:flutter/material.dart';
import 'Gridmodel.dart';
import 'LOGINPAGE.dart';
class hansikchat extends StatefulWidget {
  @override
  _PaytmState createState() => _PaytmState();
}

class _PaytmState extends State<hansikchat> {
  int _currentIndex = 0;
  int _currentIndexUp = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: _bodyItem(),
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: _bottemTab());
  }

  Widget _appBar() {
    return new AppBar(
        backgroundColor: Colors.white,
        title: Text("채팅방", style: TextStyle(color: Colors.black),),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        )

    );
  }

  Widget _bottemTab() {
    return new BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/home.png",
                width: 24.0,
                height: 24.0,
              ),
              title: Text(
                '홈',
              )


          ),
          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/shopping-bagg.png",
                width: 24.0,
                height: 24.0,
              ),
              title: Text(
                '참여 내역',
              )),

          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/bank.png",
                width: 24.0,
                height: 24.0,
              ),
              title: Text(
                '추천',
              )),
          new BottomNavigationBarItem(
              icon: Image.asset(
                "assets/delivery.png",
                width: 24.0,
                height: 24.0,
              ),
              title: Text(
                'MY',
              )),
        ]);
  }

  Widget _bodyItem() {

    return SingleChildScrollView(
      child: new Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children:
            List<GridItem>.generate(8, (int index) {
              return GridItem(_getGridItemList()[index]);


            }),
          ),

        ],
      ),
    );
  }

  List<GridModel> _getGridItemList() {
    List<GridModel> list = new List<GridModel>();
    list.add(new GridModel("assets/hansik.png", "한식", null));
    list.add(new GridModel("assets/joongsik.png", "중식", null));
    list.add(new GridModel("assets/ilsik.png", "일식", null));
    list.add(new GridModel("assets/yangsik.png", "양식", null));
    list.add(new GridModel("assets/boonsik.png", "분식", null));
    list.add(new GridModel("assets/dessert.png", "디저트", null));
    list.add(new GridModel("assets/pizza.png", "피자", null));
    list.add(new GridModel("assets/etc.png", "기타", null));
    return list;
  }




  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget dots(int current, index) {
    if (current != index) {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            //color: dotColor(index),
          ));
    } else {
      return Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            //color: dotColor(index)
          ));
    }
  }



}

class GridItem extends StatelessWidget {
  GridModel gridModel;

  GridItem(this.gridModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1 / 2),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                gridModel.imagePath,
                width: 80,
                height: 80,
                color: gridModel.color,
              ),
              //     Padding(
              //     padding: const EdgeInsets.only(top: 5),
              //    child: Text(
              //     gridModel.title,
              //    textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 18),

              // ),
              // ),
              FlatButton(
                child: Text(gridModel.title),

                onPressed: () {
                  if(gridModel.title == "한식")
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  else if(gridModel.title == "중식")
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );




                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridItemTop extends StatelessWidget {
  GridModel gridModel;

  GridItemTop(this.gridModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1 / 2),
      child: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                gridModel.imagePath,
                width: 30,
                height: 30,
                color: gridModel.color,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  gridModel.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





