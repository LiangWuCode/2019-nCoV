// To parse this JSON data, do
//
//     final epidemi = epidemiFromJson(jsonString);

import 'dart:convert';

Epidemi epidemiFromJson(String str) => Epidemi.fromJson(json.decode(str));

String epidemiToJson(Epidemi data) => json.encode(data.toJson());

class Epidemi {
  int code;
  String msg;
  List<Newslist> newslist;

  Epidemi({
    this.code,
    this.msg,
    this.newslist,
  });

  factory Epidemi.fromJson(Map<String, dynamic> json) => Epidemi(
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
  List<News> news;
  List<Case> newslistCase;
  Desc desc;

  Newslist({
    this.news,
    this.newslistCase,
    this.desc,
  });

  factory Newslist.fromJson(Map<String, dynamic> json) => Newslist(
        news: List<News>.from(json["news"].map((x) => News.fromJson(x))),
        newslistCase:
            List<Case>.from(json["case"].map((x) => Case.fromJson(x))),
        desc: Desc.fromJson(json["desc"]),
      );

  Map<String, dynamic> toJson() => {
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
        "case": List<dynamic>.from(newslistCase.map((x) => x.toJson())),
        "desc": desc.toJson(),
      };
}

class Desc {
  int id;
  int createTime;
  int modifyTime;
  String infectSource;
  String passWay;
  String imgUrl;
  String dailyPic;
  List<String> dailyPics;
  String summary;
  bool deleted;
  String countRemark;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  int seriousCount;
  int suspectedIncr;
  int confirmedIncr;
  int curedIncr;
  int deadIncr;
  int seriousIncr;
  String virus;
  String remark1;
  String remark2;
  String remark3;
  String remark4;
  String remark5;
  String note1;
  String note2;
  String note3;
  String generalRemark;
  String abroadRemark;
  List<dynamic> marquee;

  Desc({
    this.id,
    this.createTime,
    this.modifyTime,
    this.infectSource,
    this.passWay,
    this.imgUrl,
    this.dailyPic,
    this.dailyPics,
    this.summary,
    this.deleted,
    this.countRemark,
    this.confirmedCount,
    this.suspectedCount,
    this.curedCount,
    this.deadCount,
    this.seriousCount,
    this.suspectedIncr,
    this.confirmedIncr,
    this.curedIncr,
    this.deadIncr,
    this.seriousIncr,
    this.virus,
    this.remark1,
    this.remark2,
    this.remark3,
    this.remark4,
    this.remark5,
    this.note1,
    this.note2,
    this.note3,
    this.generalRemark,
    this.abroadRemark,
    this.marquee,
  });

  factory Desc.fromJson(Map<String, dynamic> json) => Desc(
        id: json["id"],
        createTime: json["createTime"],
        modifyTime: json["modifyTime"],
        infectSource: json["infectSource"],
        passWay: json["passWay"],
        imgUrl: json["imgUrl"],
        dailyPic: json["dailyPic"],
        dailyPics: List<String>.from(json["dailyPics"].map((x) => x)),
        summary: json["summary"],
        deleted: json["deleted"],
        countRemark: json["countRemark"],
        confirmedCount: json["confirmedCount"],
        suspectedCount: json["suspectedCount"],
        curedCount: json["curedCount"],
        deadCount: json["deadCount"],
        seriousCount: json["seriousCount"],
        suspectedIncr: json["suspectedIncr"],
        confirmedIncr: json["confirmedIncr"],
        curedIncr: json["curedIncr"],
        deadIncr: json["deadIncr"],
        seriousIncr: json["seriousIncr"],
        virus: json["virus"],
        remark1: json["remark1"],
        remark2: json["remark2"],
        remark3: json["remark3"],
        remark4: json["remark4"],
        remark5: json["remark5"],
        note1: json["note1"],
        note2: json["note2"],
        note3: json["note3"],
        generalRemark: json["generalRemark"],
        abroadRemark: json["abroadRemark"],
        marquee: List<dynamic>.from(json["marquee"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createTime": createTime,
        "modifyTime": modifyTime,
        "infectSource": infectSource,
        "passWay": passWay,
        "imgUrl": imgUrl,
        "dailyPic": dailyPic,
        "dailyPics": List<dynamic>.from(dailyPics.map((x) => x)),
        "summary": summary,
        "deleted": deleted,
        "countRemark": countRemark,
        "confirmedCount": confirmedCount,
        "suspectedCount": suspectedCount,
        "curedCount": curedCount,
        "deadCount": deadCount,
        "seriousCount": seriousCount,
        "suspectedIncr": suspectedIncr,
        "confirmedIncr": confirmedIncr,
        "curedIncr": curedIncr,
        "deadIncr": deadIncr,
        "seriousIncr": seriousIncr,
        "virus": virus,
        "remark1": remark1,
        "remark2": remark2,
        "remark3": remark3,
        "remark4": remark4,
        "remark5": remark5,
        "note1": note1,
        "note2": note2,
        "note3": note3,
        "generalRemark": generalRemark,
        "abroadRemark": abroadRemark,
        "marquee": List<dynamic>.from(marquee.map((x) => x)),
      };
}

class News {
  int id;
  int pubDate;
  String pubDateStr;
  String title;
  String summary;
  String infoSource;
  String sourceUrl;
  String provinceId;
  String provinceName;
  int createTime;
  int modifyTime;
  int entryWay;
  int adoptType;
  int infoType;
  int dataInfoState;
  String dataInfoOperator;
  int dataInfoTime;

  News({
    this.id,
    this.pubDate,
    this.pubDateStr,
    this.title,
    this.summary,
    this.infoSource,
    this.sourceUrl,
    this.provinceId,
    this.provinceName,
    this.createTime,
    this.modifyTime,
    this.entryWay,
    this.adoptType,
    this.infoType,
    this.dataInfoState,
    this.dataInfoOperator,
    this.dataInfoTime,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        pubDate: json["pubDate"],
        pubDateStr: json["pubDateStr"],
        title: json["title"],
        summary: json["summary"],
        infoSource: json["infoSource"],
        sourceUrl: json["sourceUrl"],
        provinceId: json["provinceId"],
        provinceName:
            json["provinceName"] == null ? null : json["provinceName"],
        createTime: json["createTime"],
        modifyTime: json["modifyTime"],
        entryWay: json["entryWay"],
        adoptType: json["adoptType"],
        infoType: json["infoType"],
        dataInfoState: json["dataInfoState"],
        dataInfoOperator: json["dataInfoOperator"],
        dataInfoTime: json["dataInfoTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pubDate": pubDate,
        "pubDateStr": pubDateStr,
        "title": title,
        "summary": summary,
        "infoSource": infoSource,
        "sourceUrl": sourceUrl,
        "provinceId": provinceId,
        "provinceName": provinceName == null ? null : provinceName,
        "createTime": createTime,
        "modifyTime": modifyTime,
        "entryWay": entryWay,
        "adoptType": adoptType,
        "infoType": infoType,
        "dataInfoState": dataInfoState,
        "dataInfoOperator": dataInfoOperator,
        "dataInfoTime": dataInfoTime,
      };
}

class Case {
  int id;
  int createTime;
  int modifyTime;
  String tags;
  int countryType;
  String continents;
  String provinceId;
  String provinceName;
  String provinceShortName;
  String cityName;
  int confirmedCount;
  int suspectedCount;
  int curedCount;
  int deadCount;
  String comment;
  int sort;
  String caseOperator;
  int locationId;

  Case({
    this.id,
    this.createTime,
    this.modifyTime,
    this.tags,
    this.countryType,
    this.continents,
    this.provinceId,
    this.provinceName,
    this.provinceShortName,
    this.cityName,
    this.confirmedCount,
    this.suspectedCount,
    this.curedCount,
    this.deadCount,
    this.comment,
    this.sort,
    this.caseOperator,
    this.locationId,
  });

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        id: json["id"],
        createTime: json["createTime"],
        modifyTime: json["modifyTime"],
        tags: json["tags"],
        countryType: json["countryType"],
        continents: json["continents"],
        provinceId: json["provinceId"],
        provinceName: json["provinceName"],
        provinceShortName: json["provinceShortName"],
        cityName: json["cityName"],
        confirmedCount: json["confirmedCount"],
        suspectedCount: json["suspectedCount"],
        curedCount: json["curedCount"],
        deadCount: json["deadCount"],
        comment: json["comment"],
        sort: json["sort"],
        caseOperator: json["operator"],
        locationId: json["locationId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createTime": createTime,
        "modifyTime": modifyTime,
        "tags": tags,
        "countryType": countryType,
        "continents": continents,
        "provinceId": provinceId,
        "provinceName": provinceName,
        "provinceShortName": provinceShortName,
        "cityName": cityName,
        "confirmedCount": confirmedCount,
        "suspectedCount": suspectedCount,
        "curedCount": curedCount,
        "deadCount": deadCount,
        "comment": comment,
        "sort": sort,
        "operator": caseOperator,
        "locationId": locationId,
      };
}
