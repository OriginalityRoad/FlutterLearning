import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'ChooseSaxView.dart';

class CompleteMessageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CompleteMessageViewState();
  }
}

class CompleteMessageViewState extends State<CompleteMessageView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build44
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
//        title: "",
        backgroundColor: Color.fromRGBO(44, 56, 73, 1),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {},
          ),
        ],
      ),
      body: showCompleteMessageView(context),
    );
  }
}

Widget showCompleteMessageView(BuildContext context) {
  return new Container(
    padding: EdgeInsets.all(20),
    color: Color.fromRGBO(44, 56, 73, 1),
//color: Colors.orange,

    child: new ListView(
      children: <Widget>[
        new Image.asset('assets/images/jkzk_image_tou.png'),

        new Container(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: new Text(
            "Hi，我是你的首席健康官",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
            textAlign: prefix0.TextAlign.center,
          ),
        ),
        new Text(
          "快来完善你的信息,\n 让我为你提供更好的健康解决方案吧",
          style: TextStyle(color: Colors.grey, fontSize: 12),
          maxLines: 2,
          textAlign: prefix0.TextAlign.center,
        ),
        new Container(
          padding: EdgeInsets.only(top: 100, left: 80, right: 80),
          child: new FlatButton(
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ChooseSaxView() ));
              },



//              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new RegisterMessageView()));

//          height: 40,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),

            child: Text(
              "完善信息",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            color: Colors.greenAccent,
          ),
        ),
      ],
    ),
  );
}
