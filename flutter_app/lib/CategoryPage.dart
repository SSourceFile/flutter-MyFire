import 'package:flutter/material.dart';
import 'package:flutterapp/HotRecomend/HotRecomend.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

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
    _tabController = new TabController(length: 6, vsync: this);
  }
  final List<Tab> titleTab = [
    Tab(text: '热门推荐',),
    Tab(text: '少妇推荐',),
    Tab(text: '清纯少女',),
    Tab(text: '青涩',),
    Tab(text: '高冷',),
    Tab(text: '温柔',),

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
            Center(child: Text('推荐')),
            Center(child: Text('推荐')),
            Center(child: Text('推荐')),
            Center(child: Text('推荐')),
            Center(child: Text('推荐'))
          ],
        ),
      ),
    );
  }

}