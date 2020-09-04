import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_first/PersionCenterView.dart';

class HomePageView extends StatefulWidget {
  var parentContext;
  HomePageView(this.parentContext);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageViewController(this.parentContext);
  }
}

class _HomePageViewController extends State<HomePageView> {
  var parentContext;
  _HomePageViewController(this.parentContext);

    bool selecedColor ;
  int count;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");

    count=1;
    selecedColor = true;

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");

  }

  @override
  void didUpdateWidget(HomePageView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");

  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");

  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");

  }
  @override
  Widget build(BuildContext context) {
    print("build");

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: _startTextViewLine(this.parentContext),
    );
  }



  Widget _startTextViewLine(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Image.asset(
          'assets/images/IMG_3258.jpg',
          width: 320,
          height: 260,
          fit: BoxFit.cover,
//        color: Colors.orange,
        ),
        _titleListView(),
        _buttonSectionView(),
        _titleMessageView(),
        _persionButtonView(context),
      ],
    );
  }
//  InheritedWidget _inheritedWidgetView(){
//
//
//  }

  Widget _persionButtonView(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
      child: new MaterialButton(
        onPressed: () {
//        Navigator.of(context).pushNamed('/route/persion/roe');

//        Navigator.push(context, MaterialPageRoute(
//          // 创建一个要跳转的类，并把参数传递过去
//          builder: (context)=> PersionCenterView(),
//        ));

//        setState(() {
//          selecedColor= !selecedColor;
//         count ++;
//
//        });
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new PersionCenterView()));
        },
        child: Text(
          "个人中心$count",
          style: TextStyle(color: Colors.white),
        ),
//        color: Colors.greenAccent,

        color: selecedColor ? Colors.red:Colors.greenAccent,
      ),
    );
  }

  void _onButtonClick(BuildContext context) {
    Navigator.of(context).pushNamed('/route/persion/roe');
  }

  Widget _titleListView() {
    return new Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: <Widget>[
//        new Container(
//////          padding: const EdgeInsets.all(20),
////////          alignment: Alignment.topLeft,
//////          child: Column(
//////            children: <Widget>[
//////              new Text("sfagdhjfkvbsdfcghj"),
//////              new Text("134567890-=567890234567"),
//////            ],
//////
//////          ),
//////        ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red,
          ),
          new Text(
            "41",
          ),
        ],
      ),
    );
  }

  Widget _buttonSectionView() {
    return new Container(
      padding: const EdgeInsets.all(20),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: new Icon(
                    Icons.phone,
                    color: Colors.lightBlue,
                  ),
                ),
                new Text(
                  "CALL",
                  style: new TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
          ),
          new Expanded(
            child: Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: new Icon(
                    Icons.email,
                    color: Colors.lightBlue,
                  ),
                ),
                new Text(
                  "EMAIL",
                  style: new TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
          ),
         selecedColor ? new Expanded(
            child: Column(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: new Icon(
                    Icons.share,
                    color: Colors.lightBlue,
                  ),
                ),
                new Text(
                  "SHARE",
                  style: new TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
          ) : new Expanded(child: Container(
           child: Text(
             "改变之后的lable",
           ),

         ),
         ) ,



        ],
      ),
    );
  }

  Widget _titleMessageView() {
    return new Container(
      padding: const EdgeInsets.all(30.0),
      child: new Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        textAlign: TextAlign.left,
        maxLines: 20,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
//      softWrap: true,
      ),
    );
  }
}
