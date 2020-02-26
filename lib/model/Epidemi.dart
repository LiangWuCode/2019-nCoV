// To parse this JSON data, do
//
//     final epidemi = epidemiFromJson(jsonString);

import 'dart:convert';

Epidemi epidemiFromJson(String str) => Epidemi.fromJson(json.decode(str));

String epidemiToJson(Epidemi data) => json.encode(data.toJson());

class Epidemi {
    int code;
    String message;
    Data data;

    Epidemi({
        this.code,
        this.message,
        this.data,
    });

    factory Epidemi.fromJson(Map<String, dynamic> json) => Epidemi(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<ChinaAdd> chinaAdd;
    Desc desc;

    Data({
        this.chinaAdd,
        this.desc,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        chinaAdd: List<ChinaAdd>.from(json["chinaAdd"].map((x) => ChinaAdd.fromJson(x))),
        desc: Desc.fromJson(json["desc"]),
    );

    Map<String, dynamic> toJson() => {
        "chinaAdd": List<dynamic>.from(chinaAdd.map((x) => x.toJson())),
        "desc": desc.toJson(),
    };
}

class ChinaAdd {
    int curedCount;
    int sort;
    int countryType;
    String provinceId;
    String continents;
    Operator chinaAddOperator;
    String tags;
    int suspectedCount;
    int currentConfirmedCount;
    int confirmedCount;
    int modifyTime;
    String cityName;
    int createTime;
    int locationId;
    String provinceShortName;
    Comment comment;
    int id;
    String provinceName;
    int deadCount;

    ChinaAdd({
        this.curedCount,
        this.sort,
        this.countryType,
        this.provinceId,
        this.continents,
        this.chinaAddOperator,
        this.tags,
        this.suspectedCount,
        this.currentConfirmedCount,
        this.confirmedCount,
        this.modifyTime,
        this.cityName,
        this.createTime,
        this.locationId,
        this.provinceShortName,
        this.comment,
        this.id,
        this.provinceName,
        this.deadCount,
    });

    factory ChinaAdd.fromJson(Map<String, dynamic> json) => ChinaAdd(
        curedCount: json["curedCount"],
        sort: json["sort"],
        countryType: json["countryType"],
        provinceId: json["provinceId"],
        continents: json["continents"],
        chinaAddOperator: operatorValues.map[json["operator"]],
        tags: json["tags"],
        suspectedCount: json["suspectedCount"],
        currentConfirmedCount: json["currentConfirmedCount"],
        confirmedCount: json["confirmedCount"],
        modifyTime: json["modifyTime"],
        cityName: json["cityName"],
        createTime: json["createTime"],
        locationId: json["locationId"],
        provinceShortName: json["provinceShortName"],
        comment: commentValues.map[json["comment"]],
        id: json["id"],
        provinceName: json["provinceName"],
        deadCount: json["deadCount"],
    );

    Map<String, dynamic> toJson() => {
        "curedCount": curedCount,
        "sort": sort,
        "countryType": countryType,
        "provinceId": provinceId,
        "continents": continents,
        "operator": operatorValues.reverse[chinaAddOperator],
        "tags": tags,
        "suspectedCount": suspectedCount,
        "currentConfirmedCount": currentConfirmedCount,
        "confirmedCount": confirmedCount,
        "modifyTime": modifyTime,
        "cityName": cityName,
        "createTime": createTime,
        "locationId": locationId,
        "provinceShortName": provinceShortName,
        "comment": commentValues.reverse[comment],
        "id": id,
        "provinceName": provinceName,
        "deadCount": deadCount,
    };
}

enum Operator { ZHANGJING1 }

final operatorValues = EnumValues({
    "zhangjing1": Operator.ZHANGJING1
});

enum Comment { EMPTY, COMMENT, PURPLE }

final commentValues = EnumValues({
    "未知治愈数据统一归属上海市公卫临床中心，暂无具体分区": Comment.COMMENT,
    "": Comment.EMPTY,
    "参考卫健委统计口径，部分县区与地级市合并": Comment.PURPLE
});

class Desc {
    int seriousCount;
    String note2;
    int currentConfirmedIncr;
    String note3;
    int suspectedIncr;
    int confirmedIncr;
    String abroadRemark;
    String virus;
    int confirmedCount;
    String infectSource;
    int modifyTime;
    String passWay;
    int id;
    int deadCount;
    List<TrendChart> hbFeiHbTrendChart;
    String summary;
    String generalRemark;
    int curedCount;
    int seriousIncr;
    List<Marquee> marquee;
    int deadIncr;
    int suspectedCount;
    String imgUrl;
    int currentConfirmedCount;
    List<TrendChart> quanguoTrendChart;
    bool deleted;
    List<String> dailyPics;
    int createTime;
    int curedIncr;
    String remark5;
    String dailyPic;
    String remark4;
    String countRemark;
    String remark1;
    String note1;
    String remark3;
    String remark2;

    Desc({
        this.seriousCount,
        this.note2,
        this.currentConfirmedIncr,
        this.note3,
        this.suspectedIncr,
        this.confirmedIncr,
        this.abroadRemark,
        this.virus,
        this.confirmedCount,
        this.infectSource,
        this.modifyTime,
        this.passWay,
        this.id,
        this.deadCount,
        this.hbFeiHbTrendChart,
        this.summary,
        this.generalRemark,
        this.curedCount,
        this.seriousIncr,
        this.marquee,
        this.deadIncr,
        this.suspectedCount,
        this.imgUrl,
        this.currentConfirmedCount,
        this.quanguoTrendChart,
        this.deleted,
        this.dailyPics,
        this.createTime,
        this.curedIncr,
        this.remark5,
        this.dailyPic,
        this.remark4,
        this.countRemark,
        this.remark1,
        this.note1,
        this.remark3,
        this.remark2,
    });

    factory Desc.fromJson(Map<String, dynamic> json) => Desc(
        seriousCount: json["seriousCount"],
        note2: json["note2"],
        currentConfirmedIncr: json["currentConfirmedIncr"],
        note3: json["note3"],
        suspectedIncr: json["suspectedIncr"],
        confirmedIncr: json["confirmedIncr"],
        abroadRemark: json["abroadRemark"],
        virus: json["virus"],
        confirmedCount: json["confirmedCount"],
        infectSource: json["infectSource"],
        modifyTime: json["modifyTime"],
        passWay: json["passWay"],
        id: json["id"],
        deadCount: json["deadCount"],
        hbFeiHbTrendChart: List<TrendChart>.from(json["hbFeiHbTrendChart"].map((x) => TrendChart.fromJson(x))),
        summary: json["summary"],
        generalRemark: json["generalRemark"],
        curedCount: json["curedCount"],
        seriousIncr: json["seriousIncr"],
        marquee: List<Marquee>.from(json["marquee"].map((x) => Marquee.fromJson(x))),
        deadIncr: json["deadIncr"],
        suspectedCount: json["suspectedCount"],
        imgUrl: json["imgUrl"],
        currentConfirmedCount: json["currentConfirmedCount"],
        quanguoTrendChart: List<TrendChart>.from(json["quanguoTrendChart"].map((x) => TrendChart.fromJson(x))),
        deleted: json["deleted"],
        dailyPics: List<String>.from(json["dailyPics"].map((x) => x)),
        createTime: json["createTime"],
        curedIncr: json["curedIncr"],
        remark5: json["remark5"],
        dailyPic: json["dailyPic"],
        remark4: json["remark4"],
        countRemark: json["countRemark"],
        remark1: json["remark1"],
        note1: json["note1"],
        remark3: json["remark3"],
        remark2: json["remark2"],
    );

    Map<String, dynamic> toJson() => {
        "seriousCount": seriousCount,
        "note2": note2,
        "currentConfirmedIncr": currentConfirmedIncr,
        "note3": note3,
        "suspectedIncr": suspectedIncr,
        "confirmedIncr": confirmedIncr,
        "abroadRemark": abroadRemark,
        "virus": virus,
        "confirmedCount": confirmedCount,
        "infectSource": infectSource,
        "modifyTime": modifyTime,
        "passWay": passWay,
        "id": id,
        "deadCount": deadCount,
        "hbFeiHbTrendChart": List<dynamic>.from(hbFeiHbTrendChart.map((x) => x.toJson())),
        "summary": summary,
        "generalRemark": generalRemark,
        "curedCount": curedCount,
        "seriousIncr": seriousIncr,
        "marquee": List<dynamic>.from(marquee.map((x) => x.toJson())),
        "deadIncr": deadIncr,
        "suspectedCount": suspectedCount,
        "imgUrl": imgUrl,
        "currentConfirmedCount": currentConfirmedCount,
        "quanguoTrendChart": List<dynamic>.from(quanguoTrendChart.map((x) => x.toJson())),
        "deleted": deleted,
        "dailyPics": List<dynamic>.from(dailyPics.map((x) => x)),
        "createTime": createTime,
        "curedIncr": curedIncr,
        "remark5": remark5,
        "dailyPic": dailyPic,
        "remark4": remark4,
        "countRemark": countRemark,
        "remark1": remark1,
        "note1": note1,
        "remark3": remark3,
        "remark2": remark2,
    };
}

class TrendChart {
    String imgUrl;
    String title;

    TrendChart({
        this.imgUrl,
        this.title,
    });

    factory TrendChart.fromJson(Map<String, dynamic> json) => TrendChart(
        imgUrl: json["imgUrl"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "title": title,
    };
}

class Marquee {
    String marqueeLink;
    int id;
    String marqueeLabel;
    String marqueeContent;

    Marquee({
        this.marqueeLink,
        this.id,
        this.marqueeLabel,
        this.marqueeContent,
    });

    factory Marquee.fromJson(Map<String, dynamic> json) => Marquee(
        marqueeLink: json["marqueeLink"],
        id: json["id"],
        marqueeLabel: json["marqueeLabel"],
        marqueeContent: json["marqueeContent"],
    );

    Map<String, dynamic> toJson() => {
        "marqueeLink": marqueeLink,
        "id": id,
        "marqueeLabel": marqueeLabel,
        "marqueeContent": marqueeContent,
    };
}

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
