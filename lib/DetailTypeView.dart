
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//class DetailTypeView extends StatefulWidget {
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//  }
//}
//class _typeView extends State<DetailTypeView>{
////  @override
////  Widget build(BuildContext context) {
////    // TODO: implement build
////    return null;
////  }
////
////
////}



class DetailTypeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<DetailTypeView> {
  final _bottomNavigationColor = null;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'HOME',
                style: TextStyle(color: _bottomNavigationColor),
              ),

          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'PAGES',
                style: TextStyle(color: _bottomNavigationColor),
              ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
              ),

              title: Text(
                'AIRPLAY',
              )),
        ],
        selectedItemColor: Colors.red,
        selectedLabelStyle: TextStyle(color:Colors.red,fontSize: 15),
        showSelectedLabels: true,
//        unselectedItemColor: Colors.amberAccent,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;


          });
        },
      ),
    );
  }
}