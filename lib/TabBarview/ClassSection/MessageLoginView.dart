import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'CompleteMessageView.dart';
import 'RegisterMessageView.dart';

class MessageLoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MessageLoginViewState();
  }
}

class MessageLoginViewState extends State<MessageLoginView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("健康"),
        backgroundColor: Colors.white10,
        elevation: 0,
        actions: <Widget>[
          new MaterialButton(
            onPressed: () {
//              Navigator.push(context, Route RegisterMessageView());

//              Navigator.of(this.parentContext).push(new MaterialPageRoute(
//                  builder: (context) => new MessageLoginView()));

           Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new RegisterMessageView()));


            },

            child: Text(
              "我要注册",
              style: TextStyle(color: Colors.greenAccent, fontSize: 14),
            ),
          ),
//          new IconButton(
//            icon: Icon(Icons.add_box),
//            onPressed: () {},
//          ),
        ],
      ),
      body: _mainMessageLoginViewUI(context),
    );
  }
}

Widget _mainMessageLoginViewUI(BuildContext context) {
//  var greenColor = Color.fromARGB(20, 218, 147, 1);

  return ListView(

    padding: EdgeInsets.all(20),
    children: <Widget>[

      new Container(
        height: 130,
        padding: EdgeInsets.only(top: 20),
        child: new Text(
          "首席健康官",
//          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      new TextField(
        decoration: InputDecoration(
          hintText: "手机号",
        ),
      ),

      new Container(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new TextField(
                decoration: InputDecoration(
                  hintText: "验证码",
                ),
              ),
            ),
            new Expanded(
              child: Container(
//            width: 200,
                padding: EdgeInsets.only(top: 5, left: 20, right: 20),

                child: new OutlineButton(
                  onPressed: () {},
                  child: new Text(
                    "获取验证码",
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      new MaterialButton(
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new CompleteMessageView()));

        },
        color: Colors.greenAccent,
        child: Text(
          "登录",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),

      new Container(
//        color: Colors.greenAccent,
//        padding: const EdgeInsets.only(left: 10,),
//        padding: ,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new MaterialButton(
              onPressed: () {},
              child: Text(
                "找回密码",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
            new MaterialButton(
              onPressed: () {
              },
              child: Text(
                "账号密码登录",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      thirdLoginView(),

//
    ],
  );
}

Widget thirdLoginView() {
  return new Container(

    padding: EdgeInsets.only(top: 120),
    child: Column(
      children: <Widget>[
        new Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(

                width: 100,
                height: 1.0,
                color: Colors.grey,
              ),
              new Container(
                child: Text(
                  "其他方式登录",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ),
              new Container(
                width: 100,
                height: 1.0,
                color: Colors.grey,
              ),
            ],
          ),
        ),

        new Container(
          padding: EdgeInsets.only(top: 20),

          child: Row(
            children: <Widget>[
              new Expanded(child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    new Image.asset("assets/images/dl_icon_weixin.png",fit: BoxFit.scaleDown,height: 40,width: 40,),
                    new Text("微信",style: TextStyle(fontSize: 12,color: Colors.grey),),
                  ],


                ),

              ),
              ),

              new Expanded(child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    new Image.asset("assets/images/dl_iocn_qq.png",fit: BoxFit.cover,
                    height: 40,width: 40,),
                    new Text("QQ",style: TextStyle(fontSize: 12,color: Colors.grey),),
                  ],


                ),

              ),
              ),
              new Expanded(child: GestureDetector(

                child: Column(

                  children: <Widget>[

                    new Image.asset("assets/images/dl_icon_zhifubao.png",fit: BoxFit.cover,height: 40,width: 40,),
                    new Text("支付宝",
                    style: TextStyle(fontSize: 12,color: Colors.grey),
                    ),
                  ],


                ),

              ),
              ),
            ],
          ),
        ),




      ],
    ),
  );
}
