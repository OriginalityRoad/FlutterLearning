import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_first/TabBarview/ClassSection/PhotoListView.dart';

import 'ClassSection/MessageLoginView.dart';

class ClassSectionView extends StatefulWidget {
  var parentContext;
  ClassSectionView(this.parentContext);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState(this.parentContext);
  }
}

class _MyHomePageState extends State<ClassSectionView> {
  var parentContext;
  _MyHomePageState(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "课程",
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                Navigator.of(this.parentContext).push(new MaterialPageRoute(
                    builder: (context) => new MessageLoginView()));
              }),
        ],
      ),
      body: buildGrid(),
    );
  }
}

class _FavoriteWidgetState extends State<ClassSectionView> {
  var parentContext;
  _FavoriteWidgetState(this.parentContext);
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
//      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(1.0),
          child: new IconButton(
            icon: (_isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        new Container(
          child: Text(
            '$_favoriteCount',
            style: TextStyle(color: Colors.orange, fontSize: 15),
          ),
        ),
        new Text("$_favoriteCount"),
        new SizedBox(
          width: 60.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
            color: Colors.greenAccent,
          ),
        ),
      ],
    );
  }
}

Widget newCardView() {
  return new Card(
    color: Colors.red,
  );
}

Widget buildGrid() {
  return new GridView.extent(
    maxCrossAxisExtent: 200.0,
    padding: const EdgeInsets.all(0.0),
    childAspectRatio: 1.29,
    mainAxisSpacing: 0.0,
    crossAxisSpacing: 5.0,
    children: _buildGridTileList(100),
//    children: <Widget>[],
  );
}

List<Container> _buildGridTileList(int count) {
  return new List<Container>.generate(
    count,
    (int index) => new Container(
      color: Colors.greenAccent,
//      height: 100,
      child: new GestureDetector(
        child: new GridTile(
          child: new Image.asset('assets/images/IMG_3258.jpg'),
          footer: new Container(
            height: 60,
            padding: EdgeInsets.all(10),
            color: Color.fromARGB(102, 222, 88, 2),
            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                new Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "Name ${index + 1}",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                      new Text(
                        "Times${index + 1}",
                        style: TextStyle(color: Colors.white30, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                new Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          print(" 点击了第 ${index + 1} 个图片");
        },
      ),
    ),
  );
}

Widget oldCardView() {
  return new Container(
    decoration: new BoxDecoration(
//          color: Colors.black26,
//    image: DecorationImage(image:new Image.asset("assets/images/IMG_3258.jpg")),

        ),
    child: new Column(
      children: [
        new Row(
          children: [
            new Expanded(
              child: new Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 10.0, color: Colors.red),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
//                padding: const EdgeInsets.all(4.0),
                child: new Image.asset('assets/images/IMG_3258.jpg'),
              ),
            ),
            new Expanded(
              child: new Container(
                decoration: new BoxDecoration(
                  border:
                      new Border.all(width: 10.0, color: Colors.greenAccent),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8.0)),
                ),
                margin: const EdgeInsets.all(4.0),
                child: new Image.asset('assets/images/IMG_3258.jpg'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
