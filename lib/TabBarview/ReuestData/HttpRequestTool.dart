



import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class HttpRequestTool {

  static void _request(String url, Function successCallback,
      {String method,
        Map<String, String> params,
        Function errorCallBack}) async {
    print("url = $url");
    String errorMsg = "";
    int statusCode;
    try {
      Response response;

      BaseOptions baseOptions = new BaseOptions(
        connectTimeout: HttpUtils.TIMEOUT_CONNECT,
        receiveTimeout: HttpUtils.TIMEOUT_RECEIVE,
      );
      // dio库中默认将请求数据序列化为json，此处可根据后台情况自行修改
//      contentType:new ContentType('application', 'x-www-form-urlencoded',charset: 'utf-8')
      Options options = new Options(
        connectTimeout: HttpUtils.TIMEOUT_CONNECT,
        receiveTimeout: HttpUtils.TIMEOUT_RECEIVE,
        sendTimeout: HttpUtils.TIMEOUT_SEND,
      );
      Dio dio = new Dio(baseOptions);
      if (method == HttpUtils.GET) {
    response =
    await dio.get(url, queryParameters: params, options: options);
    } else {
    response =
    await dio.post(url, queryParameters: params, options: options);
    }
      statusCode = response.statusCode;
      if (statusCode != HttpStatus.ok) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        print("错误信息"+ errorMsg);
//        _handError(errorCallBack, errorMsg);
      } else {

        if (successCallback != null) {
          var data = json.decode(response.toString()); //对数据进行Json转化
          successCallback(data);
          print("data = " + data);
        }
      }
    } catch (exception) {
//      _handError(errorCallBack, exception.toString());
    }
  }


  /**
   * get 请求
   */
  static getData(String url, Function successCallback,
      {Map<String, String> params, Function errorCallBack}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer stringBuffer = new StringBuffer("?");
      params.forEach((key, value) {
        stringBuffer.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = stringBuffer.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    _request(url, successCallback,
        method: HttpUtils.GET, params: params, errorCallBack: errorCallBack);
  }

  /**
   * Post请求
   */
  static postData(String url, Function successCallback,
      {Map<String, String> params, Function errorCallBack}) async {
//    _request(url, successCallback,
//        method: HttpUtils.POST, params: params, errorCallBack: errorCallBack);
  }

}

class  HttpUtils {
  static String POST = "post";
  static String GET = "get";
  // ignore: non_constant_identifier_names
  static int  TIMEOUT_CONNECT = 10;
 static  int  TIMEOUT_RECEIVE = 10;

  static  int  TIMEOUT_SEND = 30;



//  static get POST => null;




}