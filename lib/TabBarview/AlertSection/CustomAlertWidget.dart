import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 底部弹出框
class CustomAlertWidget extends StatefulWidget {
  CustomAlertWidget({Key key, this.list, this.onItemClickListener})
      : assert(list != null),
        super(key: key);
  final list;
  final OnItemClickListener onItemClickListener;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomAlertWidgetState();
  }
}

typedef OnItemClickListener = void Function(int index);

class CustomAlertWidgetState extends State<CustomAlertWidget> {
  OnItemClickListener onItemClickListener;
  var itemCount;
  var itemCountList;

  double itemHeight = 44;
  var borderColor = Colors.transparent;
  double circular = 10;
  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size screenSize = MediaQuery.of(context).size;

    var deviceWidth = orientation == Orientation.portrait
        ? screenSize.width
        : screenSize.height;

    itemCount = widget.list.length;
    /// 最后还有一个cancel，所以加1
    itemCountList = itemCount + 1;
    var height = (itemCountList* itemHeight + 30).toDouble();
    var cancelContainer = Container(
      height: itemHeight,
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white, // 底色
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "取消",
          style: TextStyle(
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              color: Color(0xFF333333),
              fontSize: 18),
        ),
      ),
    );
    var listview = ListView.builder(
        itemCount: itemCountList,
        itemBuilder: (BuildContext context, int index) {
          if (index == itemCountList - 1) {
            return new GestureDetector(
              child: cancelContainer,
              onTap: () {
                onItemClickListener(itemCount);
              },
            );
          } else {
            return _getItemsContainer(context, index);
          }
        });

    var totalContainer = Container(
      child: listview,
      height: height,
      width: deviceWidth * 0.98,
    );

    var stack = Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 10,
          child: totalContainer,
        ),
      ],
    );
    return stack;
  }

  Widget _getItemsContainer(BuildContext context, int index) {
    if (itemCount == null ||  itemCount ==0 ) {
      return new Container();
    }
    var borderRadius;
    var margin;
    var border;
    var borderAll = Border.all(color: borderColor, width: 0.5);
    var borderSide = BorderSide(color: borderColor, width: 0.5);

    /// 只有一个元素
    if (itemCount == 1) {
      borderRadius = BorderRadius.circular(circular);
      margin = EdgeInsets.only(left: 10, right: 10);
      border = borderAll;
    } else if (itemCount > 1) {
      if (index == 0) {
        borderRadius = BorderRadius.only(
            topLeft: Radius.circular(circular),
            topRight: Radius.circular(circular));
        margin = EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 10,
        );
        border = Border(top: borderSide, left: borderSide, right: borderSide);
      } else if (index == itemCount - 1) {
        /// 最后一个元素
        borderRadius = BorderRadius.only(
            bottomLeft: Radius.circular(circular),
            bottomRight: Radius.circular(circular));
        margin = EdgeInsets.only(left: 10, right: 10);
        border =
            Border(bottom: borderSide, left: borderSide, right: borderSide);
      } else {
        /// 其他位置元素
        margin = EdgeInsets.only( left: 10, right: 10);
        border = Border(left: borderSide, right: borderSide);
      }
    }
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 0.5, left: 10, right: 10),
        child: Center(
          child: Text(
            widget.list[index],
            style: TextStyle(
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: Color(0xFF333333),
                fontSize: 18),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: borderRadius,
          border: border,
        ),
        height: itemHeight,
      ),
      onTap: () {
        onItemClickListener(index);
      },
    );
  }
}
