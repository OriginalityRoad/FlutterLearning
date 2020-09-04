import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_first/main.dart';

class StreamDetailWidget extends StatefulWidget {
  StreamDetailWidget({this.indexName});
  final String indexName;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StreamDetailWidgetState();
  }
}

class StreamDetailWidgetState extends State<StreamDetailWidget> {
  final List<String> listTitle = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Iterable<String> iterable = {
      "await",
      "获取异步函数 Future 的值",
      "通过 then 函数来获取",
      "stream transform",
      "create stream",
      "Stream监听方法",
      "Stream.fromFuture",
      "Stream.fromFutures",
      "Stream.fromIterable",

      "StreamController",
      "where",
      "take"
    };
    listTitle.addAll(iterable);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stream ",
        ),
      ),
      body: Container(
        child: ListView(
          children: _listTileMessage(listTitle.length),
        ),
      ),
    );
  }

  List<Container> _listTileMessage(int count) {
    return List.generate(
      count,
      (int index) => new Container(
        color: index % 2 == 0 ? Colors.greenAccent : Colors.orangeAccent,
        child: ListTile(
//        onLongPress: _getIPAddress(),
          onTap: () {
            print("点击lable " + listTitle[index]);

            onTableClick(index);
          },
          title: Text(
            "显示请求方式： " + listTitle[index],
          ),
        ),
      ),
    );
  }

  //点击方法
  void onTableClick(int index) {
    if (index == 0) {
      onSelectedOneIndex();
    } else if (index == 1) {
      onSelectedTwoIndex();
    } else if (index == 2) {
      onSelectedThiredIndex();
    } else if (index == 3) {
      getForth();
    } else if (index == 4) {
      getCreateStream();

    } else {
      print("点击lable " + widget.indexName + "\t" + listTitle[index]);
    }
  }

  Future onSelectedOneIndex() async {
    Stream<String> stream =
        new Stream<String>.fromIterable(['不开心', '面试', '没', '过']);

    await for (String s in stream) {
      print(s);
    }
  }

  void onSelectedTwoIndex() async {
    var name = await getPersionName();
    print("获取的名字为：\t " + name);

    getPersionName().then((onValue) {
      print("then获取的名字为：\t " + onValue);
    });

  }

  void onSelectedThiredIndex() async {

    try {
      var tryName = getPersionName();
      print("tryName === $tryName");
    }catch(e){
      print("获取错误信息 $e");
    }


    getPersionName().then((onValue){
      print("onValue === $onValue");

    }).catchError((onError){
      print("onError === $onError");

    });



  }

  Future getForth() async {

    var config = File('HelloWorld');
    var inputStream = config.openRead();

    var lines = inputStream.transform(utf8.decoder).transform(LineSplitter());
    await for (var line in lines) {
      print(line);
    }
  }

  void getCreateStream() async {
    var r =  timedCounter(Duration(seconds: 1), 10).listen(print);

    var resumeSignal = Future.delayed(Duration(seconds: 2));//
    r.pause(resumeSignal);
  }





  Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
//      print("======$i");
      if (i == maxCount) break;
    }
  }

  Future<String> getPersionName() async {
    return "林明";
  }
} //StreamDetailWidgetState
