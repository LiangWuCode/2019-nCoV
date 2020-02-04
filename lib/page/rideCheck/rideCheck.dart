import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:disease/api/api.dart';
import 'package:disease/components/Browser.dart';
import 'package:disease/model/RideSameNew.dart';
import 'package:flutter/material.dart';
import 'package:disease/model/RideSame.dart';
import 'dart:convert' as convert;

class RideCheck extends StatefulWidget {
  RideCheck({Key key}) : super(key: key);

  @override
  _RideCheckState createState() => _RideCheckState();
}

class _RideCheckState extends State<RideCheck> {
  int _value = 0;
  String _time = new DateTime.now().toString().substring(0, 10);
  String trainNumber = "0";
  String position = "0";
  List<Color> colorss = [Colors.teal[200], Colors.red[200], Colors.green[200]];
  List<Widget> carNumberWidgetList = new List();

  _showDataPicker() async {
    Locale myLocale = Localizations.localeOf(context);
    // print(myLocale);
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2021),
        locale: myLocale);
    setState(() {
      if (picker == null) {
        _time = "请选择日期";
      } else {
        _time = picker.toString().substring(0, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("同行程查询"),
          centerTitle: true,
          backgroundColor: Colors.red[200],
        ),
        body: ListView(shrinkWrap: true, children: <Widget>[
          Card(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "急寻：如曾与确诊患者同乘，尽快采取相应措施......",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                      fontSize: 13),
                )),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Expanded(
                  child: Text(
                    "出行方式：",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: DropdownButton(
                      value: _value,
                      hint: Text(
                        '请选择交通方式（默认全部）',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            '全部',
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                            child: Text(
                              '飞机',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 1),
                        DropdownMenuItem(
                            child: Text(
                              '火车',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 2),
                        DropdownMenuItem(
                            child: Text(
                              '地铁',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 3),
                        DropdownMenuItem(
                            child: Text(
                              '客运',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 4),
                        DropdownMenuItem(
                            child: Text(
                              '公交车',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 5),
                        DropdownMenuItem(
                            child: Text(
                              '出租车',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 6),
                        DropdownMenuItem(
                            child: Text(
                              '轮船',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 7),
                        DropdownMenuItem(
                            child: Text(
                              '其他',
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                            value: 8)
                      ],
                      underline: Container(height: 0),
                      isExpanded: true,
                      onChanged: (value) => setState(() => _value = value)),
                  flex: 3,
                )
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Expanded(
                  child: Text(
                    "乘车日期：",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.red[200],
                    child: Text(
                      _time == null ? '选择日期' : _time,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _showDataPicker(),
                  ),
                  flex: 3,
                )
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Expanded(
                  child: Text(
                    "出行车次：",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: TextField(
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                    autofocus: false,
                    textInputAction: TextInputAction.go, //开始
                    autocorrect: true,
                    decoration: InputDecoration(hintText: '例如：k22'),
                    onChanged: (value) {
                      this.setState(() {
                        this.trainNumber = value;
                      });
                    },
                  ),
                  flex: 3,
                )
              ],
            ),
          ),
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Expanded(
                  child: Text(
                    "查询地区：",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: TextField(
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                    autofocus: false,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: '例如：西安、秦皇岛'),
                    textInputAction: TextInputAction.go, //开始
                    onChanged: (value) {
                      this.setState(() {
                        this.position = value;
                      });
                    },
                  ),
                  flex: 3,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: MaterialButton(
              color: Colors.red[200],
              textColor: Colors.white,
              child: Text('查询'),
              onPressed: () async {
                carNumberWidgetList.clear();
                Map map = await getRide(_value, _time, trainNumber, position);
                final rideSame = rideSameNewFromJson(convert.jsonEncode(map));
                if (rideSame.pageInfo.count > 0) {
                  carNumberWidgetList.add(Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "查询结果：",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "查看全部",
                          //   style: TextStyle(
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.grey),
                          // ),
                        ],
                      )));
                  for (var item in rideSame.data) {
                    Widget carNumberWidget = InkWell(
                      child: Card(
                        color: colorss[Random().nextInt(3)],
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      item.startStation,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 40),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        item.type == "1"
                                            ? "飞机"
                                            : item.type == "2"
                                                ? "火车"
                                                : item.type == "3"
                                                    ? "地铁"
                                                    : item.type == "4"
                                                        ? "客运"
                                                        : item.type == "5"
                                                            ? "公交车"
                                                            : item.type == "6"
                                                                ? "出租车"
                                                                : "其他",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset("assets/images/right.png",
                                          width: 130,
                                          height: 15,
                                          fit: BoxFit.cover),
                                      Text(
                                        item.no.length > 7
                                            ? item.no.substring(0, 7)
                                            : item.no,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 40),
                                  ),
                                  Expanded(
                                    child: Text(
                                      item.endStation,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Divider(
                                color: Colors.white38,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    item.date.toString().substring(0, 10),
                                    style: TextStyle(
                                        color: Colors.white38,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      item.site.length > 6
                                          ? item.site.substring(0, 5)
                                          : item.site,
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return Browser(
                            url: item.source,
                            title: "详情",
                          );
                        }));
                      },
                    );
                    carNumberWidgetList.add(carNumberWidget);
                    setState(() {
                      carNumberWidgetList = carNumberWidgetList;
                    });
                  }
                } else {
                  carNumberWidgetList.clear();
                  setState(() {
                    carNumberWidgetList = carNumberWidgetList;
                  });
                  BotToast.showText(text: "无匹配数据！");
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: MaterialButton(
              color: Colors.grey,
              textColor: Colors.white,
              child: Text('重置'),
              onPressed: () {
                setState(() {
                  _time = "请选择日期";
                  _value = 0;
                  trainNumber = "请输入交通工具车次";
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Column(children: carNumberWidgetList),
        ]));
  }

  Future getRide(int type, String date, String carNum, String position) async {
    String realDate = date;
    if (carNum.contains("请输入交通")) {
      carNum = "0";
    }
    if (date == null || date == "请选择日期") {
      realDate = new DateTime.now().toString().substring(0, 10);
    } else if (carNum == null || carNum.contains("请输入交通")) {
      carNum = "0";
    } else if (position.toString() == null) {
      position = "0";
    } else if (type.toString() == null) {
      type = 0;
    }
    print(position);
    return await Api.ride(type, realDate, carNum, position);
  }
}
