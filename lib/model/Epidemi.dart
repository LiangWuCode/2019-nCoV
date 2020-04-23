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
    Desc desc;

    Data({
        this.desc,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        desc: Desc.fromJson(json["desc"]),
    );

    Map<String, dynamic> toJson() => {
        "desc": desc.toJson(),
    };
}

class Desc {
    int seriousCount;
    String note2;
    int currentConfirmedIncr;
    String note3;
    int suspectedIncr;
    int confirmedIncr;
    String abroadRemark;
    String virus;
    List<ForeignTrendChart> foreignTrendChart;
    int confirmedCount;
    String infectSource;
    List<ForeignTrendChart> importantForeignTrendChart;
    int modifyTime;
    String passWay;
    String globalOtherTrendChartData;
    Statistics foreignStatistics;
    int id;
    int deadCount;
    List<ForeignTrendChart> hbFeiHbTrendChart;
    String summary;
    String generalRemark;
    int curedCount;
    int seriousIncr;
    List<ForeignTrendChart> importantForeignTrendChartGlobal;
    List<ForeignTrendChart> foreignTrendChartGlobal;
    List<Marquee> marquee;
    Statistics globalStatistics;
    int deadIncr;
    int suspectedCount;
    String imgUrl;
    int currentConfirmedCount;
    List<ForeignTrendChart> quanguoTrendChart;
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
        this.foreignTrendChart,
        this.confirmedCount,
        this.infectSource,
        this.importantForeignTrendChart,
        this.modifyTime,
        this.passWay,
        this.globalOtherTrendChartData,
        this.foreignStatistics,
        this.id,
        this.deadCount,
        this.hbFeiHbTrendChart,
        this.summary,
        this.generalRemark,
        this.curedCount,
        this.seriousIncr,
        this.importantForeignTrendChartGlobal,
        this.foreignTrendChartGlobal,
        this.marquee,
        this.globalStatistics,
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
        foreignTrendChart: List<ForeignTrendChart>.from(json["foreignTrendChart"].map((x) => ForeignTrendChart.fromJson(x))),
        confirmedCount: json["confirmedCount"],
        infectSource: json["infectSource"],
        importantForeignTrendChart: List<ForeignTrendChart>.from(json["importantForeignTrendChart"].map((x) => ForeignTrendChart.fromJson(x))),
        modifyTime: json["modifyTime"],
        passWay: json["passWay"],
        globalOtherTrendChartData: json["globalOtherTrendChartData"],
        foreignStatistics: Statistics.fromJson(json["foreignStatistics"]),
        id: json["id"],
        deadCount: json["deadCount"],
        hbFeiHbTrendChart: List<ForeignTrendChart>.from(json["hbFeiHbTrendChart"].map((x) => ForeignTrendChart.fromJson(x))),
        summary: json["summary"],
        generalRemark: json["generalRemark"],
        curedCount: json["curedCount"],
        seriousIncr: json["seriousIncr"],
        importantForeignTrendChartGlobal: List<ForeignTrendChart>.from(json["importantForeignTrendChartGlobal"].map((x) => ForeignTrendChart.fromJson(x))),
        foreignTrendChartGlobal: List<ForeignTrendChart>.from(json["foreignTrendChartGlobal"].map((x) => ForeignTrendChart.fromJson(x))),
        marquee: List<Marquee>.from(json["marquee"].map((x) => Marquee.fromJson(x))),
        globalStatistics: Statistics.fromJson(json["globalStatistics"]),
        deadIncr: json["deadIncr"],
        suspectedCount: json["suspectedCount"],
        imgUrl: json["imgUrl"],
        currentConfirmedCount: json["currentConfirmedCount"],
        quanguoTrendChart: List<ForeignTrendChart>.from(json["quanguoTrendChart"].map((x) => ForeignTrendChart.fromJson(x))),
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
        "foreignTrendChart": List<dynamic>.from(foreignTrendChart.map((x) => x.toJson())),
        "confirmedCount": confirmedCount,
        "infectSource": infectSource,
        "importantForeignTrendChart": List<dynamic>.from(importantForeignTrendChart.map((x) => x.toJson())),
        "modifyTime": modifyTime,
        "passWay": passWay,
        "globalOtherTrendChartData": globalOtherTrendChartData,
        "foreignStatistics": foreignStatistics.toJson(),
        "id": id,
        "deadCount": deadCount,
        "hbFeiHbTrendChart": List<dynamic>.from(hbFeiHbTrendChart.map((x) => x.toJson())),
        "summary": summary,
        "generalRemark": generalRemark,
        "curedCount": curedCount,
        "seriousIncr": seriousIncr,
        "importantForeignTrendChartGlobal": List<dynamic>.from(importantForeignTrendChartGlobal.map((x) => x.toJson())),
        "foreignTrendChartGlobal": List<dynamic>.from(foreignTrendChartGlobal.map((x) => x.toJson())),
        "marquee": List<dynamic>.from(marquee.map((x) => x.toJson())),
        "globalStatistics": globalStatistics.toJson(),
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

class Statistics {
    int currentConfirmedCount;
    int confirmedCount;
    int curedCount;
    int currentConfirmedIncr;
    int suspectedIncr;
    int confirmedIncr;
    int curedIncr;
    int deadCount;
    int deadIncr;
    int suspectedCount;

    Statistics({
        this.currentConfirmedCount,
        this.confirmedCount,
        this.curedCount,
        this.currentConfirmedIncr,
        this.suspectedIncr,
        this.confirmedIncr,
        this.curedIncr,
        this.deadCount,
        this.deadIncr,
        this.suspectedCount,
    });

    factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        currentConfirmedCount: json["currentConfirmedCount"],
        confirmedCount: json["confirmedCount"],
        curedCount: json["curedCount"],
        currentConfirmedIncr: json["currentConfirmedIncr"],
        suspectedIncr: json["suspectedIncr"] == null ? null : json["suspectedIncr"],
        confirmedIncr: json["confirmedIncr"],
        curedIncr: json["curedIncr"],
        deadCount: json["deadCount"],
        deadIncr: json["deadIncr"],
        suspectedCount: json["suspectedCount"] == null ? null : json["suspectedCount"],
    );

    Map<String, dynamic> toJson() => {
        "currentConfirmedCount": currentConfirmedCount,
        "confirmedCount": confirmedCount,
        "curedCount": curedCount,
        "currentConfirmedIncr": currentConfirmedIncr,
        "suspectedIncr": suspectedIncr == null ? null : suspectedIncr,
        "confirmedIncr": confirmedIncr,
        "curedIncr": curedIncr,
        "deadCount": deadCount,
        "deadIncr": deadIncr,
        "suspectedCount": suspectedCount == null ? null : suspectedCount,
    };
}

class ForeignTrendChart {
    String imgUrl;
    String title;

    ForeignTrendChart({
        this.imgUrl,
        this.title,
    });

    factory ForeignTrendChart.fromJson(Map<String, dynamic> json) => ForeignTrendChart(
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
