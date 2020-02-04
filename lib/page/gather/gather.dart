import 'package:disease/components/Browser.dart';
import 'package:flutter/material.dart';

class gather extends StatefulWidget {
  gather({Key key}) : super(key: key);

  @override
  _gatherState createState() => _gatherState();
}

class _gatherState extends State<gather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("其他平台"),
          centerTitle: true,
          backgroundColor: Colors.red[300],
        ),
        body: ListView(shrinkWrap: true, children: <Widget>[
          InkWell(
            child: Card(
                color: Colors.cyan[300],
                child: Padding(
                  child: Text(
                    "丁香园",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "https://3g.dxy.cn/newh5/view/pneumonia",
                  title: "丁香园",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.teal[300],
                child: Padding(
                  child: Text(
                    "新浪",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "https://news.sina.cn/zt_d/yiqing0121",
                  title: "新浪",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.amber[200],
                child: Padding(
                  child: Text(
                    "梅斯",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "http://m.medsci.cn/wh.asp",
                  title: "梅斯",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.teal[200],
                child: Padding(
                  child: Text(
                    "知乎",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "https://www.zhihu.com/special/19681091",
                  title: "知乎",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.purple[300],
                child: Padding(
                  child: Text(
                    "第一财经",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "https://m.yicai.com/news/100476965.html",
                  title: "第一财经",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.orange[300],
                child: Padding(
                  child: Text(
                    "腾讯",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "https://news.qq.com/zt2020/page/feiyan.htm",
                  title: "腾讯",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.lime[300],
                child: Padding(
                  child: Text(
                    "夸克",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "https://broccoli.uc.cn/apps/pneumonia/routes/index",
                  title: "夸克",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.indigo[300],
                child: Padding(
                  child: Text(
                    "百度",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url: "https://voice.baidu.com/act/newpneumonia/newpneumonia",
                  title: "百度",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.indigo[300],
                child: Padding(
                  child: Text(
                    "阿里健康",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Browser(
                  url:
                      "https://alihealth.taobao.com/medicalhealth/influenzamap?spm=a2oua.wuhaninfo.more.wenzhen&chInfo=spring2020-stay-in",
                  title: "阿里健康",
                );
              }));
            },
          ),
          InkWell(
            child: Card(
                color: Colors.pink[300],
                child: Padding(
                  child: Text(
                    "问题反馈---关于我",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                )),
            onTap: () {
              showDialog<Null>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return new AlertDialog(
                    title: new Text(
                      '问题反馈',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                            "微信：",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          Image.asset(
                            "assets/images/weixin.jpg",
                            width: 120,
                            height: 120,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                          ),
                          Text(
                            "QQ:937743837",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('确定'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ]));
  }
}
