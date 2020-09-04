import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_first/TabBarview/ReuestData/HttpRequestTool.dart';
import 'package:http/http.dart' as http;
class RequestFutureDataWidget extends StatefulWidget {
//  var parentContext;
//  RequestFutureDataWidget(this.parentContext);
//

////  RequestFutureDataWidget();
//  final int indexPath;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RequestFutureDataWidgetState();
  }
}

class RequestFutureDataWidgetState extends State<RequestFutureDataWidget> {
  final List<String> listTitle = <String>[];

  var _ipAddress = 'Unknown';
  var _urlKey = "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=6214832018989180&cardBinCheck=true";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Iterable<String> iterable = {"延迟Future.delayed","Future.wait", "post请求", "get请求"};
    listTitle.addAll(iterable);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "网络请求 ",
        ),
      ),
      body: Container(
        child: ListView(
          children: _listTileMessage(listTitle.length),
        ),
      ),
    );
  }

  void onSelectedOneIndex() {
    Future.delayed(new Duration(seconds: 2), () {
      return "Hello World!";
//              throw AssertionError("Error");
    }).then((data) {
      print("success" + data);
    }).catchError((e) {
      //执行失败会走到这里
      print("执行失败会走到这里" + e);
    });
  }

  void onSelectedTwoIndex() {
    Future.wait([
      // 2秒后返回结果
      Future.delayed(new Duration(seconds: 2), () {
        return "hello";
      }),
      // 4秒后返回结果
      Future.delayed(new Duration(seconds: 4), () {
        return " world";
      })
    ]).then((results) {
      print("返回请求的数据： " + results[0] + results[1]);
    }).catchError((e) {
      print(e);
    });
  }

  List<Container> _listTileMessage(int count) {
    return List.generate(
      count,
      (int index) => new Container(
        color: index % 2 == 0 ? Colors.greenAccent : Colors.yellowAccent,
        child: ListTile(
//        onLongPress: _getIPAddress(),
          onTap: () {
            print("点击lable " + listTitle[index]);
            if (index == 0) {
              onSelectedOneIndex();
            } else if (index == 1) {
              onSelectedTwoIndex();
            } else if (index == 2) {
              _postCardHome();
              _loadRequest();
            }
            else {
              _getIPAddress();
              _getCarClassName();
              getRequestCar();

              print("点击lable _getIPAddress" + listTitle[index]);

            }
          },

          title: Text(
            "显示请求方式： " + listTitle[index],
          ),
        ),
      ),
    );
  }


  //post请求
  Future _postCardHome() async
  {

    var urlget = "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=6214832018989180&cardBinCheck=true";

    var url =  "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?";

    http.post(
        url,body: {'_input_charset':'utf-8','cardNo': '6214832018989180', 'cardBinCheck': 'true' }
    ).then((onValue){
      print("显示post请求的信息==\t ${onValue.body} \n ${onValue.statusCode} \n${onValue.headers}");

    }).catchError((onError){

      print("显示请求post的错误信息==\t $onError");

    });


    http.get(urlget).then((onValue){
      print("onValue=get= \t ${onValue.body} " );
    }).catchError((onError){});


  }

  Future _loadRequest() async {

    Dio dio = new Dio();
    Response response;
    response =
    await dio.post('https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?', data: {'_input_charset':'utf-8','cardNo': '6214832018989180', 'cardBinCheck': 'true' } );

    print("_loadRequest=\t " +  response.data.toString());





  }




  //get请求

  Future _getCarClassName() async {

    var url = "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=6214832018989180&cardBinCheck=true";

    Response response;
    Dio dio = new Dio();
    response = await dio.get(url);
    print("_getCarClassName======= "+response.data.toString());

  }


  //get请求 http://218.80.205.236:5000bylBaseCenter/dict/getDictList?type=information_type
  void _getIPAddress() async {

    print("请求返回的数据==");

    var url = "https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=6214832018989180&cardBinCheck=true";
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();


      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data.toString();

        print("_getIPAddress请求返回的数据==="+ result);
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
        print("Error请求返回的数据"+ result);

      }
    } catch (exception) {
      result = 'Failed getting IP address';
      print("catch请求返回的数据"+ result);

    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  getRequest() async {
    var httpClient = new HttpClient();
    var uri = new Uri.http("authority", "unencodedPath", {"": ""});
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
//    var responseBody = await response.transform(streamTransformer)
  }

  void getHttp() async {
//    Future<Response> response = new Dio().get("http://www.google.com");

    try {
      Future<Response> response = new Dio().get("https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=6214832018989180&cardBinCheck=true");
    } catch (e) {
      print(" fdnvkl" + e);
    }
  }




  void getRequestCar() async {
    Dio dio = new Dio();
    var response = await dio.get('https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=6214832018989180&cardBinCheck=true');
    var _content = response.data.toString();

    print(" getRequestCar==" + _content );


  }




} //buildc
