import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/HomeDetailPager.dart';
import 'package:flutterapp/common/component_index.dart';
import 'package:flutterapp/data/repository/MeiziBean.dart';

import 'package:residemenu/residemenu.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}
class HomePageState extends State with TickerProviderStateMixin{
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<Widget> views;
  MenuController _menuController;
  TabController _tabController;
  int _tabIndex = 1;
  PageController _pageController;

  //刷新
  void _onRefresh() async{
    await Future.delayed(Duration(microseconds: 1000));
    _refreshController.refreshCompleted();
  }

  //加载更多（数据加载未实现）
  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
//    items.add((items.length+1).toString());
//    if(mounted)
//      setState(() {
//
//      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {

    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _menuController = MenuController(vsync: this, direction: ScrollDirection.LEFT);
    _pageController = PageController(initialPage: 1);
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      home: ResideMenu.scaffold(
        controller: _menuController,
        enable3dRotate: true,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.orange,
            brightness: Brightness.dark,
            title: Text("首页"), leading: GestureDetector(
            child: Icon(Icons.menu),
            onTap: (){
              _menuController.openMenu(true);
            },
          ),),
          body: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus mode){
                  Widget body;
                  if(mode == LoadStatus.idle){
                    body = Text("上拉加载");
                  }else if(mode == LoadStatus.loading){
                    body = CupertinoActivityIndicator();
                  }else if(mode == LoadStatus.failed){
                    body = Text("加载失败！点击重试");
                  }else if(mode == LoadStatus.canLoading){
                    body = Text("松手加载更多");
                  }else{
                    body = Text("没有更多数据了");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body,),
                  );
                },
              ),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                itemCount: MeiziBean().listData.length,
                itemBuilder: this._getListData,
              )
          ),

        ),
        decoration: BoxDecoration(image: DecorationImage(image: new ExactAssetImage(Utils.getImgPath("guide4")),
          fit: BoxFit.cover,)),
        leftScaffold: MenuScaffold(
          header: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 60.0, maxWidth: 60.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(Utils.getImgPath("fire")),//NetworkImage('https://gank.io/images/7878d08eb776401a85deeb203372665c'),
              radius: 40.0,
            ),
          ),
          children: <Widget>[
            buildItem("各种指示器", Icon(Icons.apps, size: 25, color: Colors.blue),
                    () {
                  setState(() {
                    _tabIndex = 0;
                  });
                  _pageController.jumpToPage(0);
                  _menuController.closeMenu();
                }),
            buildItem(
                "例子", Icon(Icons.insert_emoticon, size: 25, color: Colors.blue),
                    () {
                  setState(() {
                    _tabIndex = 1;
                  });
                  _pageController.jumpToPage(1);
                  _menuController.closeMenu();
                }),
            buildItem("测试",
                Icon(Icons.airplanemode_active, size: 25, color: Colors.blue),
                    () {
                  setState(() {
                    _tabIndex = 2;
                  });
                  _menuController.closeMenu();
                  _pageController.jumpToPage(2);
                }),
            buildItem("App界面",
                Icon(Icons.format_underlined, size: 25, color: Colors.blue), () {
                  setState(() {
                    _tabIndex = 4;
                  });
                  _menuController.closeMenu();
                  _pageController.jumpToPage(4);
                }),
          ],
        ),
      ),
    );

  }

 Widget _getListData(BuildContext context, int index){
   return new GestureDetector(
    child:  Container(
      child: new Column(
        children: <Widget>[
          new Image.network(MeiziBean().listData[index]["imageUrl"], height: 500,width: 600.0, fit: BoxFit.fill,),
          _whiteLine,
          new Text(MeiziBean().listData[index]["title"], style:  TextStyle(fontSize: 20, color: Colors.blueAccent),),
          _whiteLine,
        ],
      ),
    ),
     onTap: (){
       onItemClick(index, context, MeiziBean().listData);
     },
   );

 }
 Widget get _whiteLine{
   return new Container(
     height: 15,
   );
 }

  void onItemClick(int index, BuildContext context, List listData) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPager(indexs: index, listData: listData)));
  }

  Widget buildItem(String msg, Widget icon, Function voidCallBack) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: ResideMenuItem(
          title: msg,
          titleStyle: TextStyle(fontSize: 20.0, color: Colors.blue),
          icon: icon,
          right: const Icon(Icons.arrow_forward, color: Colors.blue),
        ),
        onTap: voidCallBack,
      ),
    );
  }
}