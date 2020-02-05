import 'package:disease/api/api.dart';
import 'package:disease/components/Browser.dart';
import 'package:disease/model/Rumor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';

class Rumor extends StatefulWidget {
  Rumor({Key key}) : super(key: key);

  @override
  _RumorState createState() => _RumorState();
}

class _RumorState extends State<Rumor> {
  Future _getRumor;
  List<Widget> rumorList = new List();
  List<Widget> rumorList1 = new List();
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  int page = 1;
  bool isEnd = false;
  Future<void> _onRefresh() async {
    page = 1;
    rumorList.clear();
    await rumorWidget();
  }

  Future rumorWidget() async {
    final rumor = rumorFromJson(convert.jsonEncode(await getRumor(page)));
    for (var item in rumor.newslist) {
      Widget rumor = Card(
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                  ),
                  Image.network(
                    item.imgsrc.contains("http")
                        ? item.imgsrc
                        : "http:" + item.imgsrc,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                        Text(
                          item.desc,
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                        Padding(
                          child: Text(
                            item.explain,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: Colors.red),
                          ),
                          padding: EdgeInsets.only(right: 10, top: 5.0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return Browser(
                url: "https://vp.fact.qq.com/article?id=" + item.id,
                title: "辟谣",
              );
            }));
          },
        ),
      );
      rumorList.add(rumor);
    }
    setState(() {
      rumorList = rumorList;
    });
  }

  Future<void> _onLoading() async {
    page++;
    await rumorWidget();
  }

  @override
  void initState() {
    super.initState();
    _getRumor = getRumor(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("权威辟谣"),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: EasyRefresh(
          key: _easyRefreshKey,
          firstRefresh: true,
          autoLoad: true,
          onRefresh: _onRefresh,
          loadMore: _onLoading,
          limitScroll: isEnd,
          refreshHeader: BallPulseHeader(
            key: _headerKey,
          ),
          refreshFooter: BallPulseFooter(
            key: _footerKey,
          ),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              //true 滑动到底部
              reverse: false,
              padding: EdgeInsets.all(0.0),
              //滑动到底部回弹效果
              physics: BouncingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: rumorList))),
    );
  }

  Future getRumor(page) async {
    return await Api.rumor({"page": page});
  }
}
