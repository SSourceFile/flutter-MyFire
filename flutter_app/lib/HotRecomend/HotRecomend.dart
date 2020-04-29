import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/HotRecomend/ArticleItem.dart';
import 'package:flutterapp/common/common.dart';

import 'package:flutterapp/data/api/HttpRequest.dart';
import 'package:flutterapp/data/api/apis.dart';
import 'package:flutterapp/data/repository/HotBean.dart';
import 'package:flutterapp/widgetTools/Toaster.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HotRecomend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotRecomendState();
  }
}

class HotRecomendState extends State {
  var bannerData = [];
  var ListData = [];

  @override
  void initState() {
    super.initState();
    _loadBanner();
    _loadListData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          child: ListView.builder(
              itemCount: ListData.length,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return _getBanner();
                } else {
                  return ArticleItem(ListData[index]);
                }
              })
          )

      ),
    );
  }

  void _loadBanner() async {
    Net.instance.get(Constant.wan_android + WanAndroidApi.BANNER, null,
        success: (data) {
          List<dynamic> d = data;

          setState(() {
            bannerData = data;
          });
        }, failure: (err) {
          Toaster.show(err.toString());
        });
  }

  Widget _getBanner() {
    return new SizedBox(
      height: 150.0,
      child: new Swiper(
        itemHeight: 150.0,
        itemCount: bannerData.length,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            bannerData[index]["imagePath"],
          );
        },
        viewportFraction: 0.8,
        autoplay: true,
        scale: 0.9,
      ),
    );
  }

//  Widget _getListData(BuildContext context, int index) {
//    return new GestureDetector(
//      child: Container(
//        child: new Column(
//          children: <Widget>[
//            new Image.network(ListData[index]["envelopePic"], width: 80.0, height: 80.0,),
//            new Text(ListData[index]["chapterName"],
//              style: TextStyle(fontSize: 20, color: Colors.blueAccent),),
//          ],
//        ),
//      ),
//      onTap: () {
////        onItemClick(index, context, MeiziBean().listData);
//      },
//    );
//  }

  void _loadListData() async{
    Map<String, dynamic> param = new HashMap();
    param["pageIndex"] = 1;
    Net.instance.get(Constant.wan_android+WanAndroidApi.PROJECT_LIST, param, success: (data){
        print("成功1"+data.toString());
        setState(() {
          ListData = data["datas"];
//          var map = json.decode(data["datas"]);
//          HotBean b = HotBean.fromJson(map);
//          print("shuju "+b.author);
        });
    }, failure: (err){
        print("失败");
    });

  }
}
