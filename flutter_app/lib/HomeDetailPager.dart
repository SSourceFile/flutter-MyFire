import 'package:flutter/material.dart';
import 'package:flutterapp/widgetTools/Toolbar.dart';

class HomeDetailPager extends StatefulWidget{
  final List listData;
  final int indexs;
  HomeDetailPager({this.indexs, this.listData});
  
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeDetailPagerState(index: indexs, listData: listData);
  }

}

class HomeDetailPagerState extends State{
  final int index;
  final List listData;
  HomeDetailPagerState({this.index, this.listData});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Toolbar.toolbar("妹子详情图"
          ""),
      body: Column(
        children: <Widget>[
          Image.network(listData[index]["imageUrl"], fit: BoxFit.fill, height: 500.0, width: 600,)
        ],
      )
    );
  }

}