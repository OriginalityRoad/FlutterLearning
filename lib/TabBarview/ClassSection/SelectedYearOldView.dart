import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_first/TabBarview/ClassSection/ChooseHeightView.dart';

import 'package:numberpicker/numberpicker.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectedYearOldView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SelectedYearOldViewState();
  }
}

/*区分年月日选择器*/
enum NUM_TYPE {
  NUM_TYPE_YEAR,
  NUM_TYPE_MONTH,
  NUM_TYPE_DAY,
}

class SelectedYearOldViewState extends State<SelectedYearOldView> {
  /*最下年份*/
  int _minYear = 1960;

  /*最大年份*/
  int _maxYear = 2020;

  /*当前选中年份*/
  int _seleYear = 1990;

  /*最小月份*/
  int _minMonth = 1;

  /*最大月份*/
  int _maxMonth = 12;

  /*当前选中月份*/
  int _seleMonth = 1;

  /*最小日*/
  int _minDay = 1;

  /*最大日*/
  int _maxDay = 30;

  /*当前选中日*/
  int _seleDay = 1;

  /*当前年份*/
  int _currentYear = 0;

  int _babyAge = 0;

  /*当前月份*/
  int _currentMonth = 0;

  /*当前日*/
  int _currentDay = 0;

  @override
  void initState() {
    // TODO: implement initState
    _getCurrentDate(); //获取当前时间
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(44, 56, 73, 1),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(44, 56, 73, 1),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 190,
              child: Column(
                children: <Widget>[
                  new Image.asset('assets/images/jkzk_image_tou.png'),
                  new Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new Text(
                      "偷偷告诉健康官你的年龄，我不会 \n 告诉别人的~",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          new NumberPicker.integer(
                              initialValue: _seleYear,
                              minValue: _minYear,
                              maxValue: _maxYear,
                              lastStr: "年",
                              itemExtent: 50,
                              infiniteLoop: false,
                              onChanged: (n) {
                                _seleYear = n;
                                _numChanged(n, NUM_TYPE.NUM_TYPE_YEAR);
                              }),
                          new NumberPicker.integer(
                              initialValue: _seleMonth,
                              minValue: _minMonth,
                              maxValue: _maxMonth,
                              lastStr: "月",
                              onChanged: (n) {
                                _numChanged(n, NUM_TYPE.NUM_TYPE_MONTH);
                              }),
                          new NumberPicker.integer(
                              initialValue: _seleDay,
                              minValue: _minDay,
                              maxValue: _maxDay,
                              lastStr: "日",
                              onChanged: (n) {
                                _numChanged(n, NUM_TYPE.NUM_TYPE_DAY);
                              })
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            new Container(
//              color: Colors.purple,

              height: 40,



              child: new FlatButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ChooseHeightView()));
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "下一步   ",
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                    new Container(
                      height: 20,
                      child: new Image.asset("assets/images/xznl_icon_next.png"),
                    )
                  ],
                ),
              ),
//              height: 45,
//              width: MediaQuery.of(context).size.width,
//              decoration: BoxDecoration(
//                  color: Colors.purple,
//                  borderRadius: BorderRadius.all(Radius.circular(20))),
//              child: Container(
//                child: FlatButton(
//                    onPressed: () {
////    Navigator.of(context)
////        .push(new MaterialPageRoute(builder: (context) {
////    return NickNamePage();
////    }));
////
//                    },
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(20))),
//                    child: Text(
//                      "下一步",
//                      style: TextStyle(color: Colors.white, fontSize: 14),
//                    )),
//              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
//      body: new Container(
//        color: Color.fromRGBO(44, 56, 73, 1),
//        padding: EdgeInsets.all(20),
//        child: Column(
//          children: <Widget>[
//            new Image.asset('assets/images/jkzk_image_tou.png'),
//            new Container(
//              padding: EdgeInsets.only(top: 10),
//              child: new Text(
//                "偷偷告诉健康官你的年龄，我不会 \n 告诉别人的~",
//                style: TextStyle(color: Colors.white,fontSize: 15),
//                textAlign: TextAlign.center,
//              ),
//            ),
//
//           new Expanded(
//
//              child: Column(
//
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                new  Center(
//
//                    child: Container(
//
//                      child: Row(
//                        children: <Widget>[
//                          new NumberPicker.integer(
//                              initialValue: _seleYear,
//                              minValue: _minYear,
//                              maxValue: _maxYear,
//                              lastStr: "年",
//                              itemExtent: 50,
//                              infiniteLoop: false,
//                              onChanged: (n) {
//                                _seleYear = n;
//                                _numChanged(n, NUM_TYPE.NUM_TYPE_YEAR);
//                              }),
//                          new NumberPicker.integer(
//                              initialValue: _seleMonth,
//                              minValue: _minMonth,
//                              maxValue: _maxMonth,
//                              lastStr: "月",
//                              onChanged: (n) {
//                                _numChanged(n, NUM_TYPE.NUM_TYPE_MONTH);
//                              }),
//                          new NumberPicker.integer(
//                              initialValue: _seleDay,
//                              minValue: _minDay,
//                              maxValue: _maxDay,
//                              lastStr: "日",
//                              onChanged: (n) {
//                                _numChanged(n, NUM_TYPE.NUM_TYPE_DAY);
//                              })
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//
//
//
//
//
//
//
//
//
//          ],
//
//        ),
//      ),
//    );
//  }

//Widget _showMessageview(){
//  return new Container(
//    child: ,
//  );
//}
/*选择器变化时*/
  void _numChanged(int newNum, NUM_TYPE type) {
    setState(() {
      if (type == NUM_TYPE.NUM_TYPE_YEAR) {
        _seleYear = newNum;
        if (_seleYear == _currentYear) {
          //选到了今年
          _maxMonth = _currentMonth;
          if (_seleMonth >= _currentMonth) {
            //选中月份大于当前月份
            _seleMonth = _currentMonth;
            if (_seleDay > _currentDay) {
              //选中日大于当前日
              _seleDay = _currentDay;
              _maxDay = _currentDay;
            }
          }
        } else {
          //如果当前选择的不是当前年份
          _maxMonth = 12;
          //根据年点年份月份获取当前月天数
          _maxDay = getDaysNum(_seleYear, _seleMonth);
          if (_seleDay > _maxDay) {
            //如果当前选中日大于当前日
            _seleDay = _maxDay;
          }
        }
      } else if (type == NUM_TYPE.NUM_TYPE_MONTH) {
        //选择月份
        _seleMonth = newNum;
        if (_seleMonth == _currentMonth && _seleYear == _currentYear) {
          _maxDay = _currentDay;
        } else {
          _maxDay = getDaysNum(_seleYear, _seleMonth);
        }
        if (_seleDay > _maxDay) {
          //如果当前选中日大于当前日
          _seleDay = _maxDay;
        }
      } else if (type == NUM_TYPE.NUM_TYPE_DAY) {
        //选择日
        _seleDay = newNum;
      }

      _babyAge = _currentYear - _seleYear + 1;
      if (_seleMonth > _currentMonth) {
        _babyAge -= 1;
      } else if (_seleMonth == _currentMonth) {
        if (_seleDay > _currentDay) {
          _babyAge -= 1;
        }
      }

      print("年龄为： $_babyAge");
    });
  }

/*获取当前时间*/
  void _getCurrentDate() {
    _currentYear = int.parse(formatDate(DateTime.now(), [yyyy]));
    _maxYear = _currentYear;
    _currentMonth = int.parse(formatDate(DateTime.now(), [mm]));
    _currentDay = int.parse(formatDate(DateTime.now(), [dd]));

    setState(() {
      _seleYear = _currentYear;
      _seleMonth = _currentMonth;
      _seleDay = _currentDay;

      _maxYear = _currentYear;
      _maxMonth = _currentMonth;
      _maxDay = _currentDay;
    });

    print("当前时间：${_currentYear}-${_currentMonth}-${_currentDay}");
  }

/*根据年份月份获取当前月有多少天*/
  int getDaysNum(int y, int m) {
    if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
      return 31;
    } else if (m == 2) {
      if (((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) {
        //闰年 2月29
        return 29;
      } else {
        //平年 2月28
        return 28;
      }
    } else {
      return 30;
    }
  }
}
