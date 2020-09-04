
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterMessageView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterMessageViewState();
  }
}
class RegisterMessageViewState extends State<RegisterMessageView>{

  @override
  Widget build(BuildContext context) {
//    final placeHote= "手机号码";
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
//        backgroundColor: Colors.white,
        leading: new MaterialButton(onPressed: (){
          Navigator.of(context).pop();

        },
          child: new Image.asset("assets/images/zc_icon_back@3x.png"),


        ),
        //new Image.asset("assets/images/zc_icon_back"),
      ),

      body: showMessageView(context),
//      body: Center(
//        child:  new TextField(
//          keyboardType: TextInputType.phone,
//
//          onTap: (){
//            print("点击删除");
//
//          },
//          onChanged: (value){
//            print("点击onChanged : $value");
//
//
//          },
//          decoration: const InputDecoration(
//            hintText: "手机号",
//
//
//            suffixIcon: Icon(Icons.cancel),
//
//          ),
//        ),
//      ),

    );
  }

}
Widget showMessageView(BuildContext context){

  return new ListView(
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

      new Container(
        padding: EdgeInsets.only(bottom: 20),
        child: new TextField(

          keyboardType: TextInputType.phone,

          onTap: (){
            print("点击删除");

          },
          onChanged: (value){
            print("点击onChanged : $value");


          },
          decoration: const InputDecoration(
            hintText: "手机号",


            suffixIcon: Icon(Icons.cancel),

          ),
        ),
      ),

      new Container(
        padding: EdgeInsets.only(bottom: 20),
        child: new TextField(
          decoration: const InputDecoration(
            hintText: "短信验证码",
            suffixIcon: Icon(Icons.cancel),

          ),
        ),

      ),
      new Container(
        padding: EdgeInsets.only(bottom: 40),
        child:   new TextField(
          decoration: const InputDecoration(
            hintText: "密码",
            suffixIcon: Icon(Icons.remove_red_eye),

          ),
        ),

      ),
//      new Container(
//        padding: EdgeInsets.only(bottom: 20),
//
//      ),



      new MaterialButton(onPressed: (){

      },
        color: Colors.greenAccent,
      child: Text(
        "立即注册",
        style: TextStyle(color: Colors.white,fontSize: 15),
      ),

        height: 50,

      ),

      new MaterialButton(onPressed: (){

      },
        child: Text(
          "已有账号，去登录",
          style: TextStyle(color: Colors.grey,fontSize: 11),
        ),

        height: 50,

      ),



    ],
  );
}