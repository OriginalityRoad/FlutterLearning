import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_first/TabBarview/OpenCammeraPhoto/OpenCameraPhoto.dart';
import 'package:flutter_app_first/TabBarview/ReuestData/RequestFutureDataWidget.dart';

import 'AlertSection/AlertWidget.dart';
import 'NotificationWidgetSection/NotificationType.dart';
import 'NotificationWidgetSection/NotificationWidget.dart';
import 'ReuestData/StreamDetailWidget.dart';

class MyselfView extends StatefulWidget {
  var customContext;
  MyselfView(this.customContext);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyselfViewState(this.customContext);
  }
}

class MyselfViewState extends State<MyselfView> {
  var pushContext;
  MyselfViewState(this.pushContext);
  List<String> list = <String>[];
  int indexPath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add("Stream");
    list.add("网络请求");
    list.add("打开相机相册");
    list.add("弹框");
    list.add("通知");
    list.add("通知==NotificationType");
    list.add("手势");
    Iterable<String> alble = {"push跳转", "动画", "ListView"} as Iterable<String>;
    list.addAll(alble);
    indexPath=0;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "我的",
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),


      body: showListTileView(),
    );
  }

  //第三种方法
  Widget showListTileView() {
    return new Container(
      child: ListView(
        children: _buildShowListTileView(list.length, list),
      ),
    );
  }

  List<Container> _buildShowListTileView(int count, List<String> strList) {
    return List<Container>.generate(
      count,
      (int index) => new Container(
//    color: index==1 ? Colors.red :Colors.greenAccent,
        child: new ListTile(
          onTap: () {
//            print("第三种方法==点击第 $index 区 $list");

            setState(() {
              indexPath =index;
            });

            onTapView(index);

          },
          leading: new Icon(Icons.print),
          title: Text(
            "显示的第$index 区===   "+ list[index],
            style: new TextStyle(color: Colors.lightBlueAccent, fontSize: 16),
          ),
          subtitle: new Text(
            list[index],
//          strList(index),
              ),
        ),
      ),
    );
  }


  void onTapView(int index){
    if (index ==0){

      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context) => new StreamDetailWidget(indexName: list[index], )));

    }
    else if(index==1){
      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context) => new RequestFutureDataWidget()));

    }
    else if(index==2){
      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context) => new OpenCammeraPhoto()));

    }else if(index==3){
      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context) => new AlertWidget()));

    }else if(index==4){
      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context)=>  new NotificationWidget()));
    }
    else if(index==5){
      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context)=>  new NotificationType()));
    }
    else if(index==6){
      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context)=>  new NotificationWidget()));
    }else if(index==7){
      Navigator.of(this.pushContext).push(new MaterialPageRoute(builder: (context)=>  new NotificationWidget()));
    }


  }



} //build

//第二种方法

Widget showListViewUI() {
  return Center(
    child: ListView(
      children: <Widget>[
        new ListTile(
          title: Text(
            "ewriufurf",
            style: TextStyle(color: Colors.orange, fontSize: 17),
          ),
          leading: new Icon(Icons.cloud),
          onTap: () {
            print("点击了ListTile");
          },
//          isThreeLine: true,

          subtitle: Text(
            "edsgfuvfdiv",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        new ListTile(
          title: Text(
            "ewriuf234765urf",
            style: TextStyle(color: Colors.orange, fontSize: 17),
          ),
          subtitle: Text(
            "edsg41fuvfdiv",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        new ListTile(
          title: Text(
            "ewriu12345furf",
            style: TextStyle(color: Colors.orange, fontSize: 17),
          ),
          subtitle: Text(
            "edsgfuvfdiv",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        new ListTile(
          title: Text(
            "ewriuwerfurf",
            style: TextStyle(color: Colors.orange, fontSize: 17),
          ),
          subtitle: Text(
            "edsgd3ffuvfdiv",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        new ListTile(
          title: Text(
            "ewriufurorkfverfgf",
            style: TextStyle(color: Colors.orange, fontSize: 17),
          ),
          subtitle: Text(
            "edsgfuvfdi345v",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

//第一种方法
Widget showListViewUIMore() {
  return Container(
    padding: EdgeInsets.all(10),
    child: new ListView(
      children: _buildShowView(30),
    ),
  );
}

List<Container> _buildShowView(int count) {
  return new List<Container>.generate(
    count,
    (int index) => new Container(
//    height: 60,
      padding: EdgeInsets.all(10),
      color: Colors.greenAccent,

      child: new GestureDetector(
        onTap: () {
          print("第一种方法点击了第 $index 行");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Icon(Icons.airplay),
            new Expanded(
              child: new Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "显示第 $index 行",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    new Text("显示第 $index 区")
                  ],
                ),
              ),
            ),
            new Icon(Icons.airplanemode_active),
          ],
        ),
      ),
    ),
  );
}
