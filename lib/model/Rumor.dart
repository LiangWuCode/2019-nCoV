// To parse this JSON data, do
//
//     final rumor = rumorFromJson(jsonString);
///谣言实体

import 'dart:convert';

Rumor rumorFromJson(String str) => Rumor.fromJson(json.decode(str));

String rumorToJson(Rumor data) => json.encode(data.toJson());

class Rumor {
  int code;
  String msg;
  List<Newslist> newslist;

  Rumor({
    this.code,
    this.msg,
    this.newslist,
  });

  factory Rumor.fromJson(Map<String, dynamic> json) => Rumor(
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
  String id;
  DateTime date;
  String title;
  String explain;
  String imgsrc;
  String markstyle;
  String desc;
  String author;

  Newslist({
    this.id,
    this.date,
    this.title,
    this.explain,
    this.imgsrc,
    this.markstyle,
    this.desc,
    this.author,
  });

  factory Newslist.fromJson(Map<String, dynamic> json) => Newslist(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        explain: json["explain"],
        imgsrc: json["imgsrc"],
        markstyle: json["markstyle"],
        desc: json["desc"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "title": title,
        "explain": explain,
        "imgsrc": imgsrc,
        "markstyle": markstyle,
        "desc": desc,
        "author": author,
      };
}
