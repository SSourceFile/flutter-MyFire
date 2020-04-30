import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/common/CommonKey.dart';
import 'package:flutterapp/common/component_index.dart';
import 'package:flutterapp/setting/Setting.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutterapp/utils/http_utils.dart';

import 'common/component_index.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  TimerUtil _timerUtil;

  List<String> _guideList = [
    Utils.getImgPath('guide1'),
    Utils.getImgPath('guide2'),
    Utils.getImgPath('guide3'),
    Utils.getImgPath('guide4'),
  ];

  List<Widget> _bannerList = new List();

  int _status = 0;
  int _count = 3;

  SplashModel _splashModel;

  @override
  void initState() {
    super.initState();
//    _loadSplashData();
    _initAsync();
  }

  void _loadSplashData() async {
    _splashModel = SpUtil.getObj(
        Constant.key_splash_model, (v) => SplashModel.fromJson(v));
    if (_splashModel != null) {
      setState(() {});
    }
    HttpUtils httpUtil =  HttpUtils();
    httpUtil.getSplash().then((model) async {
      await SpUtil.getInstance();

      if (!ObjectUtil.isEmpty(model.imgUrl)) {
        if (_splashModel == null || (_splashModel.imgUrl != model.imgUrl)) {
          SpUtil.putString(Constant.key_splash_model, json.encode(model));
          setState(() {
            _splashModel = model;
          });
        }
      } else {
        SpUtil.putString(Constant.key_splash_model, '');
      }
    });
  }

  void _initAsync() {
    Observable.just(1).delay(new Duration(milliseconds: 1000)).listen((_) {
      if (SpUtil.getBool(Constant.key_guide) != true &&
          ObjectUtil.isNotEmpty(_guideList)) {
        SpUtil.putBool(Constant.key_guide, true);
        _initBanner();
      } else {
        _initSplash();
      }
    });
  }

  void _initBanner() {
    _initBannerData();
    setState(() {
      _status = 2;
    });
  }

  void _initBannerData() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      if (i == length - 1) {
        _bannerList.add(new Stack(
          children: <Widget>[
            new Image.asset(
              _guideList[i],
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            new Align(
              alignment: Alignment.bottomCenter,
              child: new Container(
                margin: EdgeInsets.only(bottom: 160.0),
                child: new RaisedButton(
                  textColor: Colors.white,
                  color: Colors.indigoAccent,
                  child: Text(
                    '立即体验',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () {
                    _goMain();
                  },
                ),
              ),
            ),
          ],
        ));
      } else {
        _bannerList.add(new Image.asset(
          _guideList[i],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ));
      }
    }
  }

  void _initSplash() {
//    _splashModel = SpHelper.getSplashModel();
//    if (_splashModel == null) {
//      _goMain();
//    } else {
      _doCountDown();
//    }
  }

  void _doCountDown() {
    setState(() {
      _status = 1;
    });
    _timerUtil = new TimerUtil(mTotalTime: 3 * 1000);
    _timerUtil.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      setState(() {
        _count = _tick.toInt();
      });
      if (_count == 0) {
        _goMain();
      }
    });
    _timerUtil.startCountDown();
  }

  void _goMain() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
//      CommonKey.onGenerateRoute(RouteSettings(name: ''));
  }

  Widget _buildSplashBg() {
    return new Image.asset(
      Utils.getImgPath('start'),
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _buildAdWidget() {
//    if (_splashModel == null) {
//      return new Container(
//        height: 0.0,
//        color: Colors.blueAccent,
//      );
//    }
    return new Offstage(
      offstage: !(_status == 1),
      child: new InkWell(
        onTap: () {
          if (ObjectUtil.isEmpty(_splashModel.url)) return;
          _goMain();
//          NavigatorUtil.pushWeb(context,
//              title: _splashModel.title, url: _splashModel.url);
        },
        child: new Container(
          alignment: Alignment.center,
          child: new Image.asset(
            Utils.getImgPath('start'),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
//            imageUrl: _splashModel.imgUrl,
//            placeholder: _buildSplashBg(),
//            errorWidget: _buildSplashBg(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.transparent,
      child: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: !(_status == 0),
            child: _buildSplashBg(),

          ),
          new Offstage(
            offstage: !(_status == 2),
            child: ObjectUtil.isEmpty(_bannerList)
                ? new Container()
                : new Swiper(
                autoStart: false,
                circular: false,
                indicator: CircleSwiperIndicator(
                  radius: 4.0,
                  padding: EdgeInsets.only(bottom: 30.0),
                  itemColor: Colors.black26,
                ),
                children: _bannerList),
          ),
           _buildAdWidget(),
          new Offstage(
            offstage: !(_status == 1),
//            child:  new InkWell(
//              onTap: () {
//                if (ObjectUtil.isEmpty(_splashModel.url)) return;
//                _goMain();
////                NavigatorUtil.pushWeb(context,
////                    title: _splashModel.title, url: _splashModel.url);
//              },
              child: new Container(
                alignment: Alignment.center,
                child: new Image.asset(
                  Utils.getImgPath('start'),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
//                  placeholder: _buildSplashBg(),
//                  errorWidget: _buildSplashBg(),
                ),
//              ),
            ),
          ),
          new Offstage(
            offstage: !(_status == 1),
            child: new Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  _goMain();
                },
                child: new Container(
                    padding: EdgeInsets.all(12.0),
                    child: new Text(
                      '跳过 $_count',
                      style: new TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    decoration: new BoxDecoration(
                        color: Color(0x66000000),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: new Border.all(
                            width: 0.33, color: Colors.amberAccent))),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timerUtil != null) _timerUtil.cancel(); //记得中dispose里面把timer cancel。
  }
}



