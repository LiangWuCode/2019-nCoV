import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'api.dart';

/* 
* 封装 restful 请求 
* 
* GET、POST、DELETE、PATCH 
* 主要作用为统一处理相关事务： 
* - 统一处理请求前缀； 
* - 统一打印请求信息； 
* - 统一打印响应信息； 
* - 统一打印报错信息； 
*/
class HttpUtils {
  static Dio dio;
  static final debug = Api.debug;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';
  static Future<Map> request(String url, {data, method}) async {
    BotToast.showLoading();
    data = data ?? {};
    method = method ?? 'GET';
    // restful 请求处理
    // /gysw/search/hist/:user_id user_id=27
    // 最终生成 url 为 /gysw/search/hist/27
    data.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    if (debug) {
      //打印请求相关信息：请求地址、请求方式、请求参数
      print('请求地址：【' + method + '  ' + url + '】');
      print('请求参数：' + data.toString());
    }

    Dio dio = createInstance();
    var result;
    try {
      Response response = await dio.request(url,
          data: data, options: new Options(method: method));
      result = response.data;
      if (debug) {
        // 打印响应相关信息
        print('响应数据：' + response.toString());
      }
    } on DioError catch (e) {
      // 打印请求失败相关信息
      print('请求出错：' + e.toString());
    }
    BotToast.closeAllLoading();
    return result;
  }

  // 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 自定义Header
      Map<String, dynamic> headers = {
        'Accept': 'application/json,*/*',
        'Content-Type': 'application/json',
        'Authorization': "",
        "uuid": ""
      };
      // 全局属性：请求前缀、连接超时时间、响应超时时间
      Options options = new Options(
          baseUrl: Api.baseUrl,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers: headers);

      dio = new Dio(options);
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
