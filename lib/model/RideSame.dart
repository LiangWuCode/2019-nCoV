// To parse this JSON data, do
//
//     final rideSame = rideSameFromJson(jsonString);

import 'dart:convert';

RideSame rideSameFromJson(String str) => RideSame.fromJson(json.decode(str));

String rideSameToJson(RideSame data) => json.encode(data.toJson());

class RideSame {
  int code;
  String msg;
  List<Newslist> newslist;

  RideSame({
    this.code,
    this.msg,
    this.newslist,
  });

  factory RideSame.fromJson(Map<String, dynamic> json) => RideSame(
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
  int id;
  DateTime date;
  String start;
  String end;
  int type;
  String no;
  String memo;
  NoSub noSub;
  String posStart;
  String posEnd;
  String source;
  String who;
  int verified;
  String createdAt;
  String updatedAt;

  Newslist({
    this.id,
    this.date,
    this.start,
    this.end,
    this.type,
    this.no,
    this.memo,
    this.noSub,
    this.posStart,
    this.posEnd,
    this.source,
    this.who,
    this.verified,
    this.createdAt,
    this.updatedAt,
  });

  factory Newslist.fromJson(Map<String, dynamic> json) => Newslist(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        start: json["start"],
        end: json["end"],
        type: json["type"],
        no: json["no"],
        memo: json["memo"],
        noSub: noSubValues.map[json["no_sub"]],
        posStart: json["pos_start"],
        posEnd: json["pos_end"],
        source: json["source"],
        who: json["who"],
        verified: json["verified"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "start": start,
        "end": end,
        "type": type,
        "no": no,
        "memo": memo,
        "no_sub": noSubValues.reverse[noSub],
        "pos_start": posStart,
        "pos_end": posEnd,
        "source": source,
        "who": who,
        "verified": verified,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

enum NoSub { EMPTY, THE_12_A }

final noSubValues = EnumValues({"": NoSub.EMPTY, "座次12A": NoSub.THE_12_A});

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
