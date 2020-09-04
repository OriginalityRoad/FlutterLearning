import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class NotificationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NotificationWidgetState();
  }
}

class NotificationWidgetState extends State<NotificationWidget> {
  List<String> list = <String>[];
  @override
  void initState() {
    // TODO: implement initState
//    super.initState();
    Iterable<String> alble =
        {"基本通知", "通2333知传参", "基本通知", "基本通知",} as Iterable<String>;

    list.addAll({"基本通知", "通知传参", "基本通知1", "基本通知12",});

    print("${list.length}");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("通知"),
      ),
      body: _getBodyViewMessage(),
    );
  }

  Widget _getBodyViewMessage() {
    return NotificationListener(
//      padding: EdgeInsets.all(10),
      onNotification: (notification){
        switch (notification.runtimeType){
          case ScrollStartNotification: print("开始滚动"); break;
          case ScrollUpdateNotification: print("正在滚动"); break;
          case ScrollEndNotification: print("滚动停止"); break;
          case OverscrollNotification: print("滚动到边界"); break;
        }
      },
//      color: Colors.white,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: new Container(
              color: index.isOdd? Colors.cyanAccent :Colors.black12,

              height: 60,
              child: Text(

                "${list[index]} $index",

                textAlign: TextAlign.left,
              ),
            ),
            onTap:(){ onTipListView(index); },
          );
        },
      ),
    );
  }


  void onTipListView(int index){
    print(index);
    if(index==0){
      showSimpleNotification(
        Text("Subscribe to FilledStacks"),
        background: Colors.purple,
      );

    }else if(index==1){
      showSimpleNotification(
        Text("Subscribe to FilledStacks"),
        background: Colors.purple,
        autoDismiss: false,
        trailing: Builder(builder: (context) {
          return FlatButton(
              textColor: Colors.yellow,
              onPressed: () {
                OverlaySupportEntry.of(context).dismiss();
              },
              child: Text('Dismiss'));
        }),
      );


    }else if(index==2){

    }else if(index==3){

    }else if(index==4){

    }else if(index==5){

    }


  }








}//class










