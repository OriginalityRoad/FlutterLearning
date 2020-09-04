
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_first/PersionCenterDetailView.dart';

class PersionCenterView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PersionCenterViewState();
  }
}
class _PersionCenterViewState extends State<PersionCenterView>
{

  bool count;
  void initState() {
    // TODO: implement initState
    super.initState();
    print("PersionCenterView==initState");

    count = true ;
//    selecedColor = true;

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("PersionCenterView==didChangeDependencies");

  }
@override
  void didUpdateWidget(PersionCenterView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("PersionCenterView==didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("PersionCenterView==deactivate");

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("PersionCenterView==dispose");

  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("PersionCenterView==reassemble");

  }
  @override
  Widget build(BuildContext context) {
    print("PersionCenterView==build");
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
        leading: IconButton(icon: new Icon(Icons.share), onPressed: (){
          Navigator.pop(context);
        }),

      ),

      body: new Center(

        child: Column(
          children: <Widget>[
             RichText(

              text: TextSpan(
                text: "今天推拿技巧悲愤交加 $count  >>>",
                style: TextStyle(color: Colors.red,backgroundColor: Colors.yellowAccent,fontSize: 27),
                children:<TextSpan>[
                  TextSpan(
                    text: "3456789推拿推拿234",
                    style: TextStyle(color: Colors.greenAccent,fontStyle: FontStyle.italic),
                  ),

                  TextSpan(
                      text: "难道送豆浆",
                      style:TextStyle(backgroundColor: Colors.blue,fontWeight: FontWeight.w900)
                  ),




                ],


              ),



            ),

            MaterialButton(onPressed: (){

              setState(() {
                count = !count ;
              });

              Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>  new PersionCenterDetailView()));

            },
            child: Text(
              "跳转到下一界面",

            ),

              color: Colors.greenAccent,
            ),

            SizedBox(
              height: count ? 70 : 30 ,
              child: Container(
                color: Colors.orangeAccent,
              ),
            ),


            count ? MaterialButton(onPressed: (){

//              setState(() {
//                count ++;
//              });

              Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>  new PersionCenterDetailView()));

            },
              child: Text(
                "跳转到下一界面",
                style: TextStyle(fontSize: 17,color: Colors.purple),
              ),

              color: Colors.greenAccent,
            ) : new Text(

              "跳转到下一界面Text",
              style: TextStyle(fontSize: 20,color: Colors.red),
            ),

          ],
        ),

      ),
    );
  }
}





