
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersionCenterDetailView    extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PersionCenterDetailViewState();
  }
}

class PersionCenterDetailViewState extends State<PersionCenterDetailView>{







  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "个人中心详情"
        ),
      ),
      body: Center(
        child:Text(
            "个人中心详情"
        ) ,
      ),

    );
  }
}