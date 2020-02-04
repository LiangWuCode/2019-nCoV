// To parse this JSON data, do
//
//     final rideSameNew = rideSameNewFromJson(jsonString);

import 'dart:convert';

RideSameNew rideSameNewFromJson(String str) =>
    RideSameNew.fromJson(json.decode(str));

String rideSameNewToJson(RideSameNew data) => json.encode(data.toJson());

class RideSameNew {
  List<Datum> data;
  PageInfo pageInfo;
  Map<String, String> typeList;

  RideSameNew({
    this.data,
    this.pageInfo,
    this.typeList,
  });

  factory RideSameNew.fromJson(Map<String, dynamic> json) => RideSameNew(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        typeList: Map.from(json["typeList"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pageInfo": pageInfo.toJson(),
        "typeList":
            Map.from(typeList).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Datum {
  DateTime date;
  String no;
  String noSub;
  String startTime;
  String endTime;
  String type;
  String intro;
  String startStation;
  String endStation;
  String source;
  String site;
  String verified;

  Datum({
    this.date,
    this.no,
    this.noSub,
    this.startTime,
    this.endTime,
    this.type,
    this.intro,
    this.startStation,
    this.endStation,
    this.source,
    this.site,
    this.verified,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: DateTime.parse(json["date"]),
        no: json["no"],
        noSub: json["no_sub"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        type: json["type"],
        intro: json["intro"],
        startStation: json["start_station"],
        endStation: json["end_station"],
        source: json["source"],
        site: json["site"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "no": no,
        "no_sub": noSub,
        "start_time": startTime,
        "end_time": endTime,
        "type": type,
        "intro": intro,
        "start_station": startStation,
        "end_station": endStation,
        "source": source,
        "site": site,
        "verified": verified,
      };
}

class PageInfo {
  int count;
  int totalPage;
  int size;
  int page;
  int offset;

  PageInfo({
    this.count,
    this.totalPage,
    this.size,
    this.page,
    this.offset,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        count: json["count"],
        totalPage: json["totalPage"],
        size: json["size"],
        page: json["page"],
        offset: json["offset"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "totalPage": totalPage,
        "size": size,
        "page": page,
        "offset": offset,
      };
}
