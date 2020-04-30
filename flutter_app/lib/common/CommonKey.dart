

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Splash.dart';
import 'package:flutterapp/web/WebView.dart';

import '../MainPage.dart';

class CommonKey{
  static final initRouteName = '/';
  static final Map<String, WidgetBuilder> router = {
    '/Splash': (BuildContext context) => SplashPage(),
    '/HomePage': (BuildContext context) => MainPage(),
    '/WebView': (BuildContext context) => BaseWebView()
  };
//  static const String WEBVIEW = "/WebView";
  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    // 统一处理路由
    final String name = settings.name;
    final Function pageContentBuilder = router[name];

    //定义当前需要返回得route对象
    Route route;
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        //带参数的处理方式
        switch(name){
          default:
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context, arguments: settings.arguments)
            );
            break;
        }
      }else{
        //不带参数的处理方式
        switch(name){
          case '/login':
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context),
                fullscreenDialog: true
            );
            break;
          default:
            route = CupertinoPageRoute(
                builder: (context) => pageContentBuilder(context)
            );
            break;
        }
      }
    }
    return route;
  }
}