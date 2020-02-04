// To parse this JSON data, do
//
//     final epidemicDetail = epidemicDetailFromJson(jsonString);

import 'dart:convert';

EpidemicDetail epidemicDetailFromJson(String str) =>
    EpidemicDetail.fromJson(json.decode(str));

String epidemicDetailToJson(EpidemicDetail data) => json.encode(data.toJson());

class EpidemicDetail {
  int code;
  String msg;
  List<Newslist> newslist;

  EpidemicDetail({
    this.code,
    this.msg,
    this.newslist,
  });

  factory EpidemicDetail.fromJson(Map<String, dynamic> json) => EpidemicDetail(
        code: json["code"],
        msg: json["msg"],
        newslist: List<Newslist>.from(
            json["newslist"].map((x) => Newslist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "newslist": List<dynamic>.from(newslist.map((x) => x.toJson())),
      };
}

class Newslist {
  String provinceName;
  String provinceShortName;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  Comment comment;
  List<City> cities;

  Newslist({
    this.provinceName,
    this.provinceShortName,
    this.confirmedCount,
    this.suspectedCount,
    this.curedCount,
    this.deadCount,
    this.comment,
    this.cities,
  });

  factory Newslist.fromJson(Map<String, dynamic> json) => Newslist(
        provinceName: json["provinceName"],
        provinceShortName: json["provinceShortName"],
        confirmedCount: json["confirmedCount"],
        suspectedCount: json["suspectedCount"],
        curedCount: json["curedCount"],
        deadCount: json["deadCount"],
        comment: commentValues.map[json["comment"]],
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "provinceName": provinceName,
        "provinceShortName": provinceShortName,
        "confirmedCount": confirmedCount,
        "suspectedCount": suspectedCount,
        "curedCount": curedCount,
        "deadCount": deadCount,
        "comment": commentValues.reverse[comment],
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  String cityName;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;

  City({
    this.cityName,
    this.confirmedCount,
    this.suspectedCount,
    this.curedCount,
    this.deadCount,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityName: json["cityName"],
        confirmedCount: json["confirmedCount"],
        suspectedCount: json["suspectedCount"],
        curedCount: json["curedCount"],
        deadCount: json["deadCount"],
      );

  Map<String, dynamic> toJson() => {
        "cityName": cityName,
        "confirmedCount": confirmedCount,
        "suspectedCount": suspectedCount,
        "curedCount": curedCount,
        "deadCount": deadCount,
      };
}

enum Comment { THE_22, EMPTY, THE_1, THE_11, COMMENT }

final commentValues = EnumValues({
  "治愈数据统一归属上海市公卫临床中心，暂无具体分区": Comment.COMMENT,
  "": Comment.EMPTY,
  "待明确地区：治愈 1": Comment.THE_1,
  "待明确地区：死亡 1，治愈 1": Comment.THE_11,
  "待明确地区：治愈 22": Comment.THE_22
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
