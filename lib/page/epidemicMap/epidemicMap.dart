import 'package:disease/model/Epidemi.dart';
import 'package:flutter/material.dart';
import 'package:disease/api/api.dart';
import 'dart:convert' as convert;

import 'package:flutter_swiper/flutter_swiper.dart';

class EpidemicMap extends StatefulWidget {
  EpidemicMap({Key key}) : super(key: key);

  @override
  _EpidemicMapState createState() => _EpidemicMapState();
}


/// 用于管理状态
class ExpandState {
  bool isOpen;
  var index;
  ExpandState(this.index, this.isOpen);
}

class _EpidemicMapState extends State<EpidemicMap> {
  Future _getEpidemic;
  bool _isExpanded = false;
  int panelIndex1 = -1;
  int name = 0;
  Epidemi epidemic;
  Container ContainerWidget;

  Widget swiperWidget;
  Widget swiperWidget1;
  Widget swiperWidget2;
   Widget swiperWidget3;

  @override
  void initState() {
    super.initState();
    _getEpidemic = getEpidemic();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getEpidemic,
        builder: (context, snap) {
          if (snap.hasData) {
            epidemic = epidemiFromJson(convert.jsonEncode(snap.data));
            _swiperWidget(epidemic, context);
            _swiperWidget1(epidemic, context);
            _swiperWidget2(epidemic, context);
            _swiperWidget3(epidemic, context);
            // _expansionPanelListWidget(epidemic);
            ContainerWidget = buildContainer(epidemic);
            return Scaffold(
              appBar: AppBar(
                title: Text("疫情地图"),
                centerTitle: true,
                backgroundColor: Colors.red[300],
              ),
              body: ContainerWidget,
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  epidemic = epidemiFromJson(
                      convert.jsonEncode(await Api.epidemi({})));
                  setState(() {
                    epidemic = epidemic;
                    // _expansionPanelListWidget(epidemic);
                    _swiperWidget(epidemic, context);
                    _swiperWidget1(epidemic, context);
                    _swiperWidget2(epidemic, context);
                    _swiperWidget3(epidemic, context);
                    ContainerWidget = buildContainer(epidemic);
                  });
                },
                backgroundColor: Colors.teal[200],
                tooltip: 'Increment',
                child: Icon(Icons.refresh),
              ),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        });
  }

  Container buildContainer(Epidemi epidemic) {
    return Container(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //true 滑动到底部
          reverse: false,
          padding: EdgeInsets.all(0.0),
          //滑动到底部回弹效果
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5.0),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                  ),
                  Text(
                    "截止",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(
                            epidemic.data.desc.modifyTime)
                        .toString()
                        .substring(0, 19),
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  Text(
                    "全国以及全球统计：",
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                ],
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            epidemic.data.desc.confirmedCount.toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("确诊病例",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.confirmedIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.red[900], size: 15.0)
                              : Icon(Icons.trending_down),
                          Text(
                            epidemic.data.desc.confirmedIncr.toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            epidemic.data.desc.seriousCount.toString(),
                            style: TextStyle(
                                color: Colors.red[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("重症病例",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.seriousIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.red[900], size: 15.0)
                              : Icon(Icons.trending_down,
                                  color: Colors.green[900], size: 15.0),
                          Text(
                            epidemic.data.desc.seriousIncr.toString(),
                            style: TextStyle(
                                color: Colors.red[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          )
                        ],
                      ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text(epidemic.data.desc.suspectedCount.toString(),
                  //             style: TextStyle(
                  //                 color: Colors.red[300],
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 18.0))
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text("疑似病例",
                  //             style:
                  //                 TextStyle(color: Colors.grey, fontSize: 12.0))
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: <Widget>[
                  //         epidemic.data.desc.suspectedIncr >= 0
                  //             ? Icon(Icons.trending_up,
                  //                 color: Colors.red[900], size: 15.0)
                  //             : Icon(Icons.trending_down,
                  //                 color: Colors.green[900], size: 15.0),
                  //         Text(epidemic.data.desc.suspectedIncr.toString(),
                  //             style: TextStyle(
                  //                 color: Colors.red[300],
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 10.0))
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(epidemic.data.desc.deadCount.toString(),
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("死亡人数",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.deadIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.red[900], size: 15.0)
                              : Icon(Icons.trending_down,
                                  color: Colors.green[900], size: 15.0),
                          Text(epidemic.data.desc.deadIncr.toString(),
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(epidemic.data.desc.curedCount.toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("治愈人数",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.curedIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.green, size: 15.0)
                              : Icon(Icons.trending_down,
                                  color: Colors.green[900], size: 15.0),
                          Text(epidemic.data.desc.curedIncr.toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Card(
              //   color: Colors.red[400],
              //   child: Row(
              //     children: <Widget>[
              //       Padding(
              //         padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
              //         child: Text("全球：",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 14.0,
              //                 fontWeight: FontWeight.bold)),
              //       ),
              //     ],
              //   ),
              // ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            epidemic.data.desc.foreignStatistics.confirmedCount.toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("确诊病例",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.foreignStatistics.confirmedIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.red[900], size: 15.0)
                              : Icon(Icons.trending_down),
                          Text(
                            epidemic.data.desc.foreignStatistics.confirmedIncr.toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            epidemic.data.desc.foreignStatistics.curedCount.toString(),
                            style: TextStyle(
                                color: Colors.red[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("重症病例",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.foreignStatistics.curedIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.red[900], size: 15.0)
                              : Icon(Icons.trending_down,
                                  color: Colors.green[900], size: 15.0),
                          Text(
                            epidemic.data.desc.foreignStatistics.curedIncr.toString(),
                            style: TextStyle(
                                color: Colors.red[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0),
                          )
                        ],
                      ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text(epidemic.data.desc.foreignStatistics.suspectedCount.toString(),
                  //             style: TextStyle(
                  //                 color: Colors.red[300],
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 18.0))
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text("疑似病例",
                  //             style:
                  //                 TextStyle(color: Colors.grey, fontSize: 12.0))
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: <Widget>[
                  //         epidemic.data.desc.foreignStatistics.suspectedIncr >= 0
                  //             ? Icon(Icons.trending_up,
                  //                 color: Colors.red[900], size: 15.0)
                  //             : Icon(Icons.trending_down,
                  //                 color: Colors.green[900], size: 15.0),
                  //         Text(epidemic.data.desc.suspectedIncr.toString(),
                  //             style: TextStyle(
                  //                 color: Colors.red[300],
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 10.0))
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(epidemic.data.desc.foreignStatistics.deadCount.toString(),
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("死亡人数",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.foreignStatistics.deadIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.red[900], size: 15.0)
                              : Icon(Icons.trending_down,
                                  color: Colors.green[900], size: 15.0),
                          Text(epidemic.data.desc.foreignStatistics.deadIncr.toString(),
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0))
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(epidemic.data.desc.foreignStatistics.curedCount.toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("治愈人数",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          epidemic.data.desc.curedIncr >= 0
                              ? Icon(Icons.trending_up,
                                  color: Colors.green, size: 15.0)
                              : Icon(Icons.trending_down,
                                  color: Colors.green[900], size: 15.0),
                          Text(epidemic.data.desc.foreignStatistics.curedIncr.toString(),
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Image.asset(
                        "assets/images/bat.png",
                        width: 16.0,
                        height: 16.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text("传染源：",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                          child: Text(
                        epidemic.data.desc.note2.substring(
                            epidemic.data.desc.note2.indexOf("：") + 1,
                            epidemic.data.desc.note2.length),
                      ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Image.asset("assets/images/viruses.png",
                          width: 16.0, height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text("病毒：",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      Text(epidemic.data.desc.note1.substring(
                          epidemic.data.desc.note1.indexOf("：") + 1,
                          epidemic.data.desc.note1.length))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Image.asset("assets/images/route.png",
                          width: 16.0, height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text("传播途径：",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                        child: Text(epidemic.data.desc.note3.substring(
                            epidemic.data.desc.note3.indexOf("：") + 1,
                            epidemic.data.desc.note3.length)),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Image.asset("assets/images/person.png",
                          width: 16.0, height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text("易感人群：",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                          child: Text(epidemic.data.desc.remark1.substring(
                              epidemic.data.desc.remark1.indexOf("：") + 1,
                              epidemic.data.desc.remark1.length)))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Image.asset("assets/images/waiting.png",
                          width: 16.0, height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text("潜伏期：",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                          child: Text(epidemic.data.desc.remark2.substring(
                              epidemic.data.desc.remark2.indexOf("：") + 1,
                              epidemic.data.desc.remark2.length)))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Image.asset("assets/images/host.png",
                          width: 16.0, height: 16.0),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                      ),
                      Text("宿主：",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                          child: Text(epidemic.data.desc.remark3.substring(
                              epidemic.data.desc.remark3.indexOf("：") + 1,
                              epidemic.data.desc.remark3.length)))
                    ],
                  )
                ],
              ),
              Divider(),
              Card(
                color: Colors.teal[200],
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                      child: Text("疫情地图：",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Image.network(epidemic.data.desc.imgUrl),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Card(
                color: Colors.teal[200],
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                      child: Text("全球与中国疫情趋势：",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              swiperWidget,
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Card(
                color: Colors.teal[200],
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                      child: Text("全球重点疫区趋势图：",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              swiperWidget1,
              Card(
                color: Colors.teal[200],
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                      child: Text("全国趋势图:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              swiperWidget2,
              Card(
                color: Colors.teal[200],
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                      child: Text("对比湖北趋势图:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              swiperWidget3,
            ],
          )),
    );
  }

  void _swiperWidget(Epidemi epidemic, BuildContext context) {
    swiperWidget = ConstrainedBox(
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            epidemic.data.desc.foreignTrendChart[index].imgUrl,
            fit: BoxFit.fill,
          );
        },
        itemCount: epidemic.data.desc.foreignTrendChart.length,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Color.fromRGBO(255, 53, 39, 1),
                size: 5.0,
                color: Color.fromRGBO(203, 206, 213, 1),
                activeSize: 5.0)),
      ),
      constraints:
          BoxConstraints.loose(Size(MediaQuery.of(context).size.width, 180.0)),
    );
  }

  void _swiperWidget1(Epidemi epidemic, BuildContext context) {
    swiperWidget1 = ConstrainedBox(
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            epidemic.data.desc.importantForeignTrendChart[index].imgUrl,
            fit: BoxFit.fill,
          );
        },
        itemCount: epidemic.data.desc.importantForeignTrendChart.length,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Color.fromRGBO(255, 53, 39, 1),
                size: 5.0,
                color: Color.fromRGBO(203, 206, 213, 1),
                activeSize: 5.0)),
      ),
      constraints:
          BoxConstraints.loose(Size(MediaQuery.of(context).size.width, 180.0)),
    );
  }

void _swiperWidget2(Epidemi epidemic, BuildContext context) {
    swiperWidget2 = ConstrainedBox(
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            epidemic.data.desc.quanguoTrendChart[index].imgUrl,
            fit: BoxFit.fill,
          );
        },
        itemCount: epidemic.data.desc.quanguoTrendChart.length,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Color.fromRGBO(255, 53, 39, 1),
                size: 5.0,
                color: Color.fromRGBO(203, 206, 213, 1),
                activeSize: 5.0)),
      ),
      constraints:
          BoxConstraints.loose(Size(MediaQuery.of(context).size.width, 180.0)),
    );
  }

  void _swiperWidget3(Epidemi epidemic, BuildContext context) {
    swiperWidget3 = ConstrainedBox(
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            epidemic.data.desc.quanguoTrendChart[index].imgUrl,
            fit: BoxFit.fill,
          );
        },
        itemCount: epidemic.data.desc.quanguoTrendChart.length,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Color.fromRGBO(255, 53, 39, 1),
                size: 5.0,
                color: Color.fromRGBO(203, 206, 213, 1),
                activeSize: 5.0)),
      ),
      constraints:
          BoxConstraints.loose(Size(MediaQuery.of(context).size.width, 180.0)),
    );
  }
  Future getEpidemic() async {
    return await Api.epidemi({});
  }
}
