import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MainPage.dart';
import 'package:flutterapp/Splash.dart';
import 'package:flutterapp/blocs/bloc_index.dart';
import 'package:flutterapp/common/Global.dart';
import 'package:flutterapp/common/component_index.dart';
import 'package:flutterapp/web/WebView.dart';

import 'common/CommonKey.dart';

void main(){
  Global.init((){
    runApp(
      //Flutter全灰
//        ColorFiltered(colorFilter: ColorFilter.mode(Colors.white, BlendMode.color))
        BlocProvider<ApplicationBloc>(
          bloc: ApplicationBloc(),
          child: BlocProvider(child: MyApp(), bloc: MainBloc(),),
        ));

  });
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State{
  Color _themeColor = Colors.orange;

  @override
  void initState() {
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

//      routes: {
//        '/HomePager':(_) => MainPage(),
//        CommonKey.WEBVIEW:(_) => BaseWebView(),
//      },
      initialRoute: CommonKey.initRouteName,
      routes: CommonKey.router,
      home: new SplashPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: _themeColor,
        accentColor: _themeColor,
        indicatorColor: Colors.blue,
      ),
      onGenerateRoute: CommonKey.onGenerateRoute,
    );
  }
  @override
  void dispose() {
    super.dispose();
  }

  void init() {
//    Options opt = DioUtil.getDefOptions();
//    opt.baseUrl = Constant.server_address;
//    String cookie = SpUtil.getString(BaseConstant.keyAppToken);
//    if(ObjectUtil.isEmpty(cookie)){
//      Map<String, dynamic> _header = new Map();
//      _header["cookie"] = cookie;
//      opt.headers = _header;
//    }
//    HttpConfig config = new HttpConfig(options: opt);
//    DioUtil().setConfig(config);
  }
}