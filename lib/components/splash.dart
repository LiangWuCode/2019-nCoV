import 'package:disease/components/tab.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: TabWidget(),
      title: Text(
        '欢迎使用！',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      loadingText: Text(
        "加载中...",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      image: Image.asset("assets/images/start.png", fit: BoxFit.fill),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 60.0,
      loaderColor: Colors.red,
    );
  }
}
