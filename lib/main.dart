import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_first/CustomTabBarView.dart';
import 'package:flutter_app_first/TabBarview/CustomTabBarViewController.dart';
import 'package:flutter_app_first/DetailTypeView.dart';
import 'package:flutter_app_first/TabBarview/HomePageView.dart';
import 'package:flutter_app_first/PersionCenterView.dart';

void main(
//
//Widgets FlutterBinding.ensureInitialized();

// if (Platform.isIOS){
//  BMFMapSDK.setApiKeyAndCoordType('mIrMRcQ43x518eQl1MukMBgwwXezg9VH', BMF_COORD_TYPE.BD09LL);
//}
// else if(Platform.isAndroid){
//BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
// }
//
    ) => runApp(MyApp());


//class MyApp extends StatelessWidget{
//  final String _message = "Flutter分析";
//
//
//  @override
//  Widget build(BuildContext context) =>ErrorWidget(_message);
//}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ' Page'),
      routes: {
        '/route': (_) => new HomePageView(context),
        '/persion': (_) => new PersionCenterView(),
        '/tabBarView': (_) => new Widget_TabBar_Userdefined_Page(),
        '/tabBar': (_) => new CustomTabBarViewController(),
        '/tabBarType': (_) => new DetailTypeView(),
        '/route/persion': (_) => new PersionCenterView(),
        '/route/persion/roe': (_) => new PersionCenterView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

//    Navigator.of(context).pushNamed('/route');
    Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) => new HomePageView(context)));
  }

  void _onButtonClick() {
    Navigator.of(context).pushNamed('/route');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("登录"),
        leading: new IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
//              Scaffold.of(context).openDrawer();
            }),

        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
//                Scaffold.of(context).openDrawer();
              })
        ],
      ),
      body: _showNewLoginView(context),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget _showNewLoginView(BuildContext context) {
  return new Container(
//    mainAxisAlignment: MainAxisAlignment.start,

//     margin:EdgeInsets.all(20) ,

    padding: EdgeInsets.all(40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: new Text(
            '请输入你的手机号：',
            style: TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ),
        new TextField(
          keyboardType: TextInputType.numberWithOptions(),
          maxLength: 11,
          decoration: new InputDecoration(
            prefixIcon: Icon(Icons.person),
            suffixIcon: Icon(Icons.remove_red_eye),

//            labelText: "请输入你的手机号",
            hintText: '请输入你的手机号：',
//            disabledBorder:  InputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(
              gapPadding: 20,
              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
//            disabledBorder: InputBorder.none,
            fillColor: Colors.greenAccent,
            focusColor: Colors.red,
//            focusedBorder: const
          ),
//             strutStyle: StrutStyle(fontSize: 1,height: 1),
          scrollPadding: const EdgeInsets.all(10),
          onChanged: (ValueChanged) {
            print("请输入你的手机号为：$ValueChanged");
          },
        ),
        new Container(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: new Text(
            '请输入你的密码：',
            style: TextStyle(
              color: Colors.grey, fontSize: 16,
//            decoration: TextDecoration.lineThrough
            ),
            textAlign: TextAlign.left,
          ),
        ),
        new TextField(
          strutStyle: StrutStyle.disabled,
          decoration: new InputDecoration(
            hintText: '请输入你的密码：',
          ),
//              cursorWidth: 60,
//              textAlign: TextAlign.left,
//            keyboardType:,
        ),
        new Container(
          padding: const EdgeInsets.only(top: 30, left: 200),
          child: new MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/tabBar');
            },
            color: Colors.orange,
            child: new Text("登录"),
          ),
        ),
        new Container(
          child: new MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/tabBarType");
            },
            child: Text("动态跳转"),
            color: Colors.deepOrange,
          ),
        ),
      ],
    ),
  );
}

Widget _showLoginView() {
  return new Center(
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
    child: Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,

      children: <Widget>[
        Text(
          '输入你的手机号',
          style: TextStyle(color: Colors.blue, fontSize: 16),
          textAlign: TextAlign.left,
        ),
        new TextField(
//             strutStyle: StrutStyle(fontSize: 1,height: 1),
          scrollPadding: const EdgeInsets.all(10),
        ),
        Text(
          '输入你的密码',
          style: TextStyle(color: Colors.blue, fontSize: 16),
          textAlign: TextAlign.left,
        ),
        new TextField(
          strutStyle: StrutStyle.disabled,
//              cursorWidth: 60,
//              textAlign: TextAlign.left,
//            keyboardType:,
        ),
        new MaterialButton(
          onPressed: null,
          color: Colors.orange,
          child: new Text("登录"),
          minWidth: 200,
        ),
        new RaisedButton(
          onPressed: () {
//                Navigator.of(context).pushNamed('/persion');
          },
          child: new Text(
            "注册",
          ),
        ),

//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
      ],
    ),
  );
}
