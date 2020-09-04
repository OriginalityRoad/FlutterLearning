
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'SelectedYearOldView.dart';

class ChooseSaxView extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChooseSaxViewState();
  }
}
class ChooseSaxViewState extends State<ChooseSaxView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.cancel), onPressed: null)
        ],

        backgroundColor: Color.fromRGBO(44, 56,73, 1),
      ),

      body: _showSaxMessage(context),
    );
  }
}
Widget _showSaxMessage(BuildContext context){
  return new Container(
    color: Color.fromRGBO(44, 56, 73, 1),
    padding: EdgeInsets.all(20),


    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      
      children: <Widget>[
        new Image.asset("assets/images/jkzk_image_tou.png"),

        new Container(
          padding: EdgeInsets.only(top: 50),
          child: new MaterialButton(onPressed: (){

            Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new SelectedYearOldView()));
          },

            color: Colors.greenAccent,
            child: Text(
                "男"
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),

          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: 50),
          child:  new MaterialButton(onPressed: (){

            Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new SelectedYearOldView()));

          },

            color: Colors.orangeAccent,
            child: Text(
                "女"
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),

          ),
        ),


      ],
    ),

  );
}