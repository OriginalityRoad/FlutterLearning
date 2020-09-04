
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_first/TabBarview/HomePageView.dart';
import 'package:flutter_app_first/TabBarview/ClassSectionView.dart';
import 'package:flutter_app_first/TabBarview/MyselfView.dart';

import 'CropSquareView.dart';

class CustomTabBarViewController extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomTabBarViewState();
  }

}
class BottomTabBarState extends State<CustomTabBarViewController> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('底部tab'),
      ),
      body: new Stack(
        children: <Widget>[
          /// Offstage 这个widget 在offstage条件为假的时候，不会显示，不会响应事件，不会占用任何的父widget的空间
          new Offstage(
            // offstage参数是一个bool类型，表示是否要显示这个widget
            offstage: _currentIndex != 0,
            child: new TickerMode(
              enabled: _currentIndex == 0,
              child: new MaterialApp(
                  home: new Center(
                    child: new Text('首页'),
                  )),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 1,
            child: new TickerMode(
              enabled: _currentIndex == 1,
              child: new MaterialApp(
                  home: new Center(
                    child: new Text('广场'),
                  )),
            ),
          ),
          new Offstage(
            offstage: _currentIndex != 2,
            child: new TickerMode(
              enabled: _currentIndex == 2,
              child: new MaterialApp(
                  home: new Center(
                    child: new Text('我的'),
                  )),
            ),
          ),
        ],
      ),


      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('首页1')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.crop_square), title: new Text('广场')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.ac_unit), title: new Text('我的')),
        ],
        // 可以改变这个来设置初始的时候显示哪个tab
        currentIndex: _currentIndex,
        onTap: (int index) {
          // 这里点击tab上的item后，会执行，setState来刷新选中状态
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


class _CustomTabBarViewState  extends State<CustomTabBarViewController> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
//    appBar: new AppBar(
//    title: new Text(
//        "TabBar"
//    ),
//  ),
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: _currentIndex != 0,
            child: new TickerMode(
              enabled: _currentIndex == 0,
              child: new MaterialApp(
                home: new HomePageView(context),
//                home: new Scaffold(
//                  appBar: new AppBar(
//                    title: new Text("首页"),
//                  ),
//                  body:new Center(
//                    child: new Text('我的'),
//                  ) ,
//                ),
              ),

            ),
          ),
          new Offstage(
            offstage: _currentIndex != 1,
            child: new TickerMode(
              enabled: _currentIndex == 1,
              child: new MaterialApp(
                home: new CropSquareView(context),
//                home: new Scaffold(
//                  appBar: new AppBar(
//                    title: new Text("广场"),
//                  ),
//                  body:new Center(
//                    child: new Text('广场'),
//                  ) ,
//                ),
                ),
              ),

          ),
          new Offstage(
            offstage: _currentIndex != 2,
            child: new TickerMode(
              enabled: _currentIndex == 2,
              child: new MaterialApp(
                home: ClassSectionView(context),
//                home: new Scaffold(
//                  appBar: new AppBar(
//                    title: new Text("课程"),
//                  ),
//                  body:new Center(
//                    child: new Text('课程'),
//                  ) ,
//                ),
                ),
              ),

          ),
          new Offstage(
            offstage: _currentIndex != 3,
            child: new TickerMode(
              enabled: _currentIndex == 3,
              child: new MaterialApp(
                home: MyselfView(context),
//                home: new Scaffold(
//                  appBar: new AppBar(
//                    title: new Text("我的"),
//                  ),
//                  body:new Center(
//                    child: new Text('我的'),
//                  ) ,
//                ),
                ),
              ),
          ),

        ],


      ),

      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,

        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text('首页')),

          new BottomNavigationBarItem(
              icon: new Icon(Icons.crop_square), title: new Text('广场')),
          new BottomNavigationBarItem(icon: new Icon(Icons.class_), title: new Text('课程')),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.people), title: new Text('我的')),
        ],
        // 可以改变这个来设置初始的时候显示哪个tab
        currentIndex: _currentIndex,
        onTap: (int index) {
          // 这里点击tab上的item后，会执行，setState来刷新选中状态
          setState(() {
            _currentIndex = index;
          });
        },
      ),

    );
  }

}
