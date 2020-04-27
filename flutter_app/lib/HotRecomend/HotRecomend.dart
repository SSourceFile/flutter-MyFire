import 'package:flutter/material.dart';
import 'package:flutterapp/common/component_index.dart';
import 'package:flutterapp/data/api/apis.dart';
import 'package:flutterapp/data/repository/wan_repository.dart';

class HotRecomend extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HotRecomendState();
  }

}

class HotRecomendState extends State{

  @override
  void initState() {
    super.initState();
    _loadBanner();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text("热门推荐列表"),
    );
  }

  void _loadBanner() {
//    DioUtil().getDio().get(WanAndroidApi.BANNER).then((response){
//      callback(HomeBannerModel.fromJson(response.data));
   WanRepository().getBanner();
//    });
  }

  _getOption() {}

}