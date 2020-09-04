import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:oktoast/oktoast.dart';

import 'CommonBottomSheet.dart';
import 'CustomAlertWidget.dart';
//import 'package:oktoast/oktoast.dart';

class AlertWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AlertWidgetState();
  }
}

class AlertWidgetState extends State<AlertWidget> {
  List<String> list = <String>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Iterable<String> alble = {
      "弹框1",
      "弹框2",
      "弹框3",
      "ios底部弹出",
      "_showCupertinoAlertDialog5 \t 这是一个iOS风格的对话框",
      "CurtinoAlertDialog6 \t 这是一个iOS风格的对话框",
      "alertIndex7 \t ios底部弹出 ",
    } as Iterable<String>;
    list.addAll(alble);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "弹框",
        ),
      ),
      body: _buildView(),
    );
  }

  Widget _buildView() {
    return Container(
      child: ListView(
        children: showListViewMessage(list.length),
      ),
    );
  }

  List<Container> showListViewMessage(int count) {
    return List<Container>.generate(
      count,
      (int index) => new Container(
        color: index.isOdd ? Colors.lightBlueAccent  : Colors.orangeAccent,
        height: 60,
        child: ListTile(
          title: Text(
            list[index],
            textAlign: TextAlign.left,
          ),
          onTap: () {
            _onIndexListTile(index);
          },
        ),
      ),
    );
  }

  void _onIndexListTile(int index) {
//    Switch(value: null, onChanged: null)
    if (index == 0) {
      alertIndex1();
    } else if (index == 1) {
      alertIndex2();
    } else if (index == 2) {
      Navigator.push(context, DialogRouter(LoadingDialog(true)));

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
        return "success";
      }).then((onValue) {
        print(onValue);
      });
    } else if (index == 3) {
      alertIndex4();
    } else if (index == 4) {
      _showCupertinoAlertDialog5(
          context: context,
          title: "提示",
          content: "您没有提交的权限，\n当前仅供查阅",
          sureText: "确定");
    } else if (index == 5) {
//      showToast("Fluttertoast.showToast方法",context: context,backgroundColor: Colors.blueAccent);
//
      CurtinoAlertDialog6();
//      Toast.toast(context,msg: "中间显示的 ");
    } else if (index == 6) {
      alertIndex7();

//      Fluttertoast.
    } else if (index == 7) {
    } else if (index == 8) {}
  }

  void alertIndex4() {
    showDialog(
        barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
        context: context,
        builder: (BuildContext context) {
          var list = List();
          list.add('相册');
          list.add('相机');
          list.add('保存图片');
          list.add('相册');
          list.add('相机');
          list.add('保存图片');
          return CommonBottomSheet(
            list: list,
            onItemClickListener: (index) async {
              Navigator.pop(context);
              print("===========  $index");
            },
          );
        });
  }

  void alertIndex7() {
    showDialog(
        barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
        context: context,
        builder: (BuildContext context) {
          var list = List();
          list.add('相册');
          list.add('相机');
          list.add('保存图片');
          list.add('相册');
          list.add('相机');
          list.add('保存图片');
          return CustomAlertWidget(
            list: list,
            onItemClickListener: (index) async {
              Navigator.pop(context);
              print("===========  $index");
            },
          );
        });
  }

  void alertIndex1() {
    showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new AlertDialog(
//            contentTextStyle: ,
          title: new Text(
            '标题',
            textAlign: TextAlign.center,
          ),
          content: new SingleChildScrollView(
//            dragStartBehavior: DragStartBehavior.down,
            child: new ListBody(
              children: <Widget>[
                new Text(
                  '内容 1',
                  textAlign: TextAlign.center,
                ),
                new Text(
                  '内容 2',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                print("===确定");
              },
              child: Text("确定"),
            ),
            new MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
                print("==取消");
              },
              child: Text("取消"),
            ),

//            new FlatButton(
//              child: new Text(
//                '确定1',
//                textAlign: TextAlign.center,
//              ),
//              onPressed: () {
//                Navigator.of(context).pop();
//                print("确定");
//
//              },
//            ),
//            new FlatButton(
//              child: new Text(
//                '取消1',
//                textAlign: TextAlign.center,
//              ),
//              onPressed: () {
//                Navigator.of(context).pop();
//                print("取消");
//
//              },
//            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }

  void alertIndex2() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text(
            '选择',
            textAlign: TextAlign.center,
          ),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text(
                '选项 1',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.of(context).pop();

                print("选项1");
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                '选项 2',
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                print("选项 2");
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }

  void _showCupertinoAlertDialog5(
      {context, String title, String content, String sureText}) {
    showCupertinoDialog<int>(
        context: context,
        builder: (cxt) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text(
                  "取消",
                  style: TextStyle(color: Colors.deepOrange),
                ),
                onPressed: () {
                  Navigator.pop(cxt, 1);
                },
              ),
              CupertinoDialogAction(
                child: Text(
                  sureText,
                  style: TextStyle(color: Colors.deepOrange),
                ),
                onPressed: () {
                  Navigator.pop(cxt, 2);
//          clockJudge();
                },
              ),
            ],
          );
        });
  }

  void CurtinoAlertDialog6() {
    showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("这是一个iOS风格的对话框"),
            content: Column(
              children: <Widget>[
//                SizedBox(
//                  height: 10,
//                ),
                Align(
                  child: Text("这是一个iOS风格的对话框\n这是一个iOS风格的对话框"),
                  alignment: Alignment(0, 0),
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("取消"),
                onPressed: () {
                  Navigator.pop(context);
                  print("CurtinoAlertDialog6 \t 取消");
                },
              ),
              CupertinoDialogAction(
                child: Text("确定"),
                onPressed: () {
                  print("CurtinoAlertDialog6 \t 确定");
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void _showCustomWidgetToast() {
    var w = Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            Text(
              '添加成功',
              style: TextStyle(color: Colors.white),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
//    showToastWidget(w);
  }
}

class DialogRouter extends PageRouteBuilder {
  final Widget page;

  DialogRouter(this.page)
      : super(
          opaque: false,
          barrierColor: Colors.black54,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        );
}

class LoadingDialog extends Dialog {
  LoadingDialog(this.canceledOnTouchOutside) : super();

  ///点击背景是否能够退出
  final bool canceledOnTouchOutside;
  String alertTitleMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Material(

          ///背景透明
          color: Colors.transparent,

          ///保证控件居中效果
          child: Stack(
            children: <Widget>[
              GestureDetector(
                ///点击事件
                onTap: () {
                  if (canceledOnTouchOutside) {
                    Navigator.pop(context);
                  }
                },
              ),
              _dialog()
            ],
          )),
    );
  }

  Widget _dialog() {
    return new Center(
      ///弹框大小
      child: new SizedBox(
        width: 120.0,
        height: 120.0,
        child: new Container(
          ///弹框背景和圆角
          decoration: ShapeDecoration(
            color: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(),
              new Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: new Text(
                  "加载中",
                  style: new TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
