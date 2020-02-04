import 'package:disease/api/api.dart';
import 'package:disease/components/Browser.dart';
import 'package:disease/model/EpidemicDetail.dart';
import 'package:disease/model/News.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:lpinyin/lpinyin.dart';

class RealTimeNews extends StatefulWidget {
  RealTimeNews({Key key}) : super(key: key);

  @override
  _RealTimeNewsState createState() => _RealTimeNewsState();
}

class _RealTimeNewsState extends State<RealTimeNews> {
  List<Widget> tableListWidget = new List(); //数据表格table组件
  Future _getDatas; //多个请求结婚
  int flag = 100000; //表格是否隐藏
  List<Widget> newsListWidget = new List(); //新闻列表组件

  @override
  void initState() {
    super.initState();
    _getDatas = getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getDatas,
        builder: (context, snap) {
          if (snap.hasData) {
            ///构建table
            _tableWidget(snap);

            ///构建新闻列表
            _newsWidget(snap, context);

            return Scaffold(
                appBar: AppBar(
                  title: Text("实时疫情"),
                  centerTitle: true,
                  backgroundColor: Colors.red[300],
                ),
                body: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 15),
                      child: Text(
                        "数据来自官方通报 全国与各省通报数据可能存在差异:",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "省市",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "确诊",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "治愈",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "死亡",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                )
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                        ),
                      ],
                    ),
                    Column(
                      children: tableListWidget,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Card(
                      color: Colors.red[200],
                      child: Padding(
                        child: Text(
                          "最新疫情新闻：",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.white),
                        ),
                        padding: EdgeInsets.only(
                            top: 10.0, left: 10.0, bottom: 10.0),
                      ),
                    ),
                    Column(
                      children: newsListWidget,
                    )
                  ],
                ));
          } else {
            return Center(
              child: Text(""),
            );
          }
        });
  }

  void _tableWidget(AsyncSnapshot snap) {
    final epidemicDetail =
        epidemicDetailFromJson(convert.jsonEncode(snap.data[1]));
    List<Newslist> newslist = epidemicDetail.newslist;
    tableListWidget.clear();
    for (var i = 0; i < newslist.length; i++) {
      List<Widget> cityListWidget = new List();
      for (var item in newslist[i].cities) {
        Widget cityWidget = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 2),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    InkWell(
                        child: Row(
                          children: <Widget>[
                            Text(
                              item.cityName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: Colors.teal[300],
                              ),
                            ),
                            Padding(
                              child: Icon(Icons.keyboard_arrow_right,
                                  size: 16.0, color: Colors.teal[300]),
                              padding: EdgeInsets.only(top: 3),
                            )
                          ],
                        ),
                        onTap: () {
                          String text = "";
                          if (newslist[i].provinceShortName == "陕西") {
                            text = PinyinHelper.getPinyin(
                                    newslist[i].provinceShortName,
                                    separator: "",
                                    format: PinyinFormat.WITHOUT_TONE) +
                                "s";
                          } else {
                            text = PinyinHelper.getPinyinE(
                                newslist[i].provinceShortName,
                                separator: "",
                                format: PinyinFormat.WITHOUT_TONE);
                          }
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return Browser(
                              url:
                                  "https://news.sina.cn/project/fy2020/yq_province.shtml?province=" +
                                      text,
                              title: newslist[i].provinceShortName,
                            );
                          }));
                        })
                  ],
                ),
              ),
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      item.confirmedCount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      item.curedCount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      item.deadCount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    )
                  ],
                ),
              ),
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2),
            ),
          ],
        );
        cityListWidget.add(cityWidget);
      }
      Widget tableWidget = Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_drop_down,
                              size: 16,
                              color: Colors.white,
                            ),
                            Text(
                              newslist[i].provinceShortName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    if (flag == i) {
                      flag = 100000;
                      setState(() {
                        flag = flag;
                      });
                    } else {
                      setState(() {
                        flag = i;
                      });
                    }
                  },
                ),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        newslist[i].confirmedCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        newslist[i].curedCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Text(
                        newslist[i].deadCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 2),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
          ),
          Offstage(
              offstage: i != flag,
              child: Column(
                children: cityListWidget,
              ))
        ],
      );
      tableListWidget.add(tableWidget);
    }
  }

  void _newsWidget(AsyncSnapshot snap, BuildContext context) {
    ///构建新闻列表
    final news = newsFromJson(convert.jsonEncode(snap.data[0]));
    newsListWidget.clear();

    for (int i = 0; i < 100; i++) {
      Widget newsWidget = InkWell(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                child: Text(
                  news[i].title == null ? "" : news[i].title,
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              ),
              Padding(
                child: Text(
                  news[i].summary == null ? "" : news[i].summary,
                  style: TextStyle(
                      fontSize: 11.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(left: 10, right: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    child: Text(
                      DateTime.fromMillisecondsSinceEpoch(news[i].pubDate)
                          .toString()
                          .substring(0, 19),
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.only(right: 10, bottom: 6),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      news[i].provinceName == null ? "" : news[i].provinceName,
                      style: TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10, bottom: 10),
                    child: Text(
                      news[i].infoSource == null ? "" : news[i].infoSource,
                      style: TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        onTap: () {
          ///更具数据返回的链接，跳转到web页面
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return Browser(
              url: news[i].sourceUrl,
              title: "新闻详情",
            );
          }));
        },
      );
      newsListWidget.add(newsWidget);
    }
  }

  ///构建多个请求集合
  Future getDatas() async {
    return Future.wait([getNewNews(), getPneumonia()]);
  }

  ///获取最新的消息
  Future getNewNews() async {
    return await Api.newNews({});
  }

  ///获取最新的疫情统计数据
  Future getPneumonia() async {
    return await Api.pneumonia({});
  }
}
