import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/HomeDetailPager.dart';
import 'package:flutterapp/data/repository/MeiziBean.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget{
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    await Future.delayed(Duration(microseconds: 1000));
    _refreshController.refreshCompleted();
  }

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
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
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

}