
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CropSquareView extends StatefulWidget {
  var parentContext;
  CropSquareView(this.parentContext);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CropSquareViewState(this.parentContext);
  }
}
class CropSquareViewState  extends State<CropSquareView>{
  var parentContext;
  CropSquareViewState(this.parentContext);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("广场"),
      ),
      body: _listViewMessage(),

    );
  }
}
Widget _listViewMessage(){
  return ListView(
    children: <Widget>[
      new Image.asset(
        "assets/images/IMG_8059.jpg",
      width: 320,height: 270,
        fit: BoxFit.cover,
//        color: Colors.red,
      ),

      titleSection(),
      buttonSection(),
      titlaLableMessage(),


    ],
  );
}
Widget titleSection(){
  return Container(


//    color: Colors.blue,
    padding: EdgeInsets.all(30),
    child: Row(

      children: <Widget>[

        new Expanded(

            child: Column(
//              margin: const EdgeInsets.only(top: 8.0),

//              mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
              crossAxisAlignment:CrossAxisAlignment.start ,


              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(bottom: 9.0),
                  child: new Text("wqedgsjklrdtfgujikosdfgjk"),

                ),
                new Container(
                  child: new Text("098765432345678"),

                )

//                new Text("1234567890-098765432345678"),
              ],
            ),
        ),
        new Icon(
          Icons.star,
          color: Colors.red,
        ),
        new Text(
          "41"
        ),

      ],

    ),

  );
}
Widget buttonSection(){
  return Container(
//    color: Colors.blue,
    padding: EdgeInsets.all(20),
    child: Row(
      children: <Widget>[

        new Expanded(
            child: Column(
              children: <Widget>[

                new Icon(Icons.phone,color: Colors.blue,),
                new Text("CALL",style: TextStyle(color: Colors.blue),),
              ],

            ),

        ),
        new Expanded(

          child: Column(

            children: <Widget>[

              new Icon(Icons.home,color: Colors.blue,),
              new Text("HOME",style: TextStyle(color: Colors.blue),),
            ],

          ),

        ),

        new Expanded(
          child: Column(
            children: <Widget>[

              new Icon(Icons.star,color: Colors.blue,),
              new Text("STAR",style: TextStyle(color: Colors.blue),),
            ],

          ),

        ),



      ],
    ),

  );
}
Widget titlaLableMessage(){

  return Container(
    padding: EdgeInsets.all(20),
    child: new Text(

      "一旦拆分好titlaL旦拆分好titlaLableMessage布局，最简单的就是采取自下而上的方法来实现它。为了最大限度地减少深度ableMessage布局，最简单的就是采取自下而上的方法来实现它。为了最大限度地减少深度嵌套布局代码的视觉混淆，将一些实现放置在变量和函数中",
      style: TextStyle(fontSize: 18),

    ),
  );
}