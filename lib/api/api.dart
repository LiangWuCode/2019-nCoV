import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';

///数据api
import 'package:disease/api/HttpUtils.dart';

class Api {
  static final String baseUrl = "http://api.tianapi.com/txapi"; //数据接口
  static final String key = "7cfb4a16bb628d90a4043a707cbfca2f"; //key
  static final bool debug = true;

  ///谣言
  static final String rumorUrl = "/rumour/index?key=" + key;
  static Future rumor(data) async {
    var result =
        await HttpUtils.request(rumorUrl, method: HttpUtils.GET, data: data);
    return result;
  }

  ///谣言
  static final String rumor2Url = "/rumour/index?key=" + key;
  static Future rumor2(data) async {
    var result =
        await HttpUtils.request(rumorUrl, method: HttpUtils.GET, data: data);
    return result;
  }

  ///肺炎疫情
  static final String pneumoniaUrl = "/ncovcity/index?key=" + key;
  static Future pneumonia(data) async {
    var result = await HttpUtils.request(pneumoniaUrl,
        method: HttpUtils.GET, data: data);
    return result;
  }

  ///最新疫情消息
  // static final String epidemicUrl = "/ncov/index?key=" + key;
  // static Future epidemi(data) async {
  //   var result =
  //       await HttpUtils.request(epidemicUrl, method: HttpUtils.GET, data: data);
  //   return result;
  // }

  static final String epidemicUrl =
      "https://www.wuliang.art/ncov/statistics/flutterAppForMyself";

  static Future epidemi(data) async {
    BotToast.showLoading();
    Response response = await Dio().get(epidemicUrl);
    var result = response.data;
    BotToast.closeAllLoading();
    return result;
  }

  ///同乘查询
  // static final String rideUrl = "/ncovsame/index?key=" + key;
  // static Future ride(data) async {
  //   var result =
  //       await HttpUtils.request(rideUrl, method: HttpUtils.GET, data: data);
  //   return result;
  // }

  ///夸克同乘查询
  static final String rideUrl =
      "https://m.sm.cn/api/rest?format=json&method=Huoshenshan.trailSearch&page=1&size=100&datefrom=2020-1-1";
  static Future ride(
      int type, String date, String carNum, String position) async {
    BotToast.showLoading();
    String url = rideUrl +
        "&position=" +
        position +
        "&type=" +
        type.toString() +
        "&dateto=" +
        date +
        "&no=" +
        carNum;
    print(url);
    Response response = await Dio().get(url);
    var result = response.data;
    BotToast.closeAllLoading();
    return result;
  }

  ///获取全国最新的新闻数据
  // static final String newNewsUrl =
  //     "https://lab.isaaclin.cn/nCoV/api/news?num=50";

  static final String newNewsUrl =
      "http://49.232.173.220:3001/data/getTimelineService";

  static Future newNews(data) async {
    BotToast.showLoading();
    Response response = await Dio().get(newNewsUrl);
    var result = response.data;
    BotToast.closeAllLoading();
    return result;
  }
}
