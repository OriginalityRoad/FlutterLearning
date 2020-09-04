
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveDataWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SaveDataWidgetState();
  }
}

class SaveDataWidgetState extends State<SaveDataWidget>{

  List <String> list = <String>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add("存数据");
    list.add("getSaveStringMothed");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("数据存储"),


      ),

      body: _showBodyMessage(),

    );
  }
  Widget _showBodyMessage(){
    return Container(
      child: ListView(
        children: _listData(),
      ),
    );
  }
  List<Container> _listData(){

    return List<Container>.generate(list.length, (int count )=>new Container(
      child: ListTile(
        onTap: (){
          saveDataMoted(count);
        },
        title: Text(list[count]),


      ),
    ),);

  }
  void saveDataMoted(int index){

    if(index==0){

    }else if (index==1){

    }else if (index==2){

    }else if (index==3){

    }else if (index==4){

    }else if (index==5){

    }else if (index==6){

    }else if (index==7){

    }

  }
  Future saveStringMothed()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("name", "张森");
  }

  Future getSaveStringMothed() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var strName = sharedPreferences.get("name");
    print("获取存储的名字为：$strName");


  }



}