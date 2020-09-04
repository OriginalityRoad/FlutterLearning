import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PhotoListViewState();
  }
}

class _PhotoListViewState extends State<PhotoListView> {
  bool _selecedLable = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text(
          "Scaffold",
        ),
        leading: IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
//        flexibleSpace: FlexibleSpaceBar(
//
//          title: Text('flexibleSpace'),
//        ),
//        bottom: PreferredSize(
//
//            child: Container(
//
//              color: Colors.red,
//              child: Text('bottom'),
//            ),
//            preferredSize: Size(500.0, 30.0)
//        ),
//        automaticallyImplyLeading: true,
      ),
      body: new Center(
        child: new GestureDetector(
          onTap: () {
            setState(() {
              _selecedLable = !_selecedLable;
            });
          },
          child: Container(
            child: Center(
              child: Text(
                _selecedLable ? "selectedOne" : "selectedTwo",
              ),
            ),

            width: 200,
            height: 200,
//            color: Colors.greenAccent,

            decoration: new BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
              border: new Border.all(width: 5, color: Colors.red),
              color: _selecedLable ? Colors.lightGreen[700] : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
