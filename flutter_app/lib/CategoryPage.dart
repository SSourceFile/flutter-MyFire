import 'package:flutter/material.dart';
import 'package:flutterapp/HotRecomend/HotRecomend.dart';
import 'package:flutterapp/HotRecomend/Second/SecondCategory.dart';
import 'package:flutterapp/HotRecomend/three/ThreeCategory.dart';

/**
 * 分类
 * **/
class CategoryPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }

}

class CategoryPageState extends State with TickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }
  final List<Tab> titleTab = [
    Tab(text: '热门推荐',),
    Tab(text: '文章推荐',),
    Tab(text: '清纯少女',),

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.orange,
          title: Text("美女分类系列"),
          centerTitle: true,
          bottom: TabBar(
            controller: this._tabController,
            isScrollable: true,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(style: BorderStyle.solid, color: Colors.deepOrange, width: 3.0),
            ),
            indicatorColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: titleTab,
          ),
        ),
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[
            HotRecomend(),
            SecondCategory(),
            ThreeCategory(),
          ],
        ),
      ),
    );
  }

}