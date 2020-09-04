import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ChooseHeightView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ChooseHeightViewState();
  }
}

//final List
class ChooseHeightViewState extends State<ChooseHeightView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: ,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(44, 56, 73, 1),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
         _showMeaasge(),

        ],

      ),
    );
  }

  Widget _showMeaasge() {
    return Container(
      color: Color.fromRGBO(44, 56, 73, 1),
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          new Image.asset("assets/images/jkzk_image_tou.png"),
          new Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "你目前的健康状况",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
//          SizedBox(
//            height: 50,
//          ),
          new Container(
            height: 500,
            padding: EdgeInsets.only(top: 50),
            child: new ListView(
              physics: const NeverScrollableScrollPhysics(), //禁止滑动

              children: showListCount(5),
            ),
          )
        ],
      ),
    );
  }
}

List<Container> showListCount(int count) {
  return List<Container>.generate(
    count,
    (int index) => new Container(
      height: 70,
//      color: Colors.yellowAccent,
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            new SizedBox(
              height: 11,
            ),
            new Container(
              padding: EdgeInsets.only(left: 40, right: 20),

//          color: Colors.greenAccent,
              decoration: BoxDecoration(
                color: Color.fromRGBO(51, 195, 143, 1),
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),

              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "身高",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  new Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "无",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        new Container(
                          padding: EdgeInsets.only(left: 10),
                          child: new Image.asset(
                              "assets/images/jkzk_icon_more.png"),
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new SizedBox(
              height: 11,
            ),
          ],
        ),
        onTap: () {
          print("点击第 $index 个listtile");
        },
      ),
    ),
  );
}
