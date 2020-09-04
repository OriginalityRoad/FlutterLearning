
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class NotificationType extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}


class NotificationRouteState extends State<NotificationType> {
  String _msg="";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("通知"),

      ),

      body: Container(
        color: Colors.white,
        child: NotificationListener<NameNotification>(
      onNotification: (notification) {
        setState(() {
          _msg+=notification.name+"  ";
        });
        return true;
      },

      child: Center(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//          RaisedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
            Builder(
              builder: (context) {
                return RaisedButton(
                  //按钮点击时分发通知
                  onPressed: () => NameNotification("Hi").dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text("\n $_msg")
          ],
        ),
      ),
    ),
      ),

    );
  }
}












class NameNotification extends Notification{

NameNotification(this.name);

final String name ;

}

