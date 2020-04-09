
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/ListImage.dart';
import 'package:flutterapp/record/Record.dart';
import 'package:flutterapp/setting/Setting.dart';

class MineItemWidget extends StatelessWidget{
  String imageName;
  String title;
  @required VoidCallback onTop;
  MineItemWidget(this.imageName, this.title, {this.onTop});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 53,
            child: _mineItem(imageName, title),
          ),
          Container(
            color: Color(0xffeaeaea),
            constraints: BoxConstraints.expand(height: 1.0),
          )
        ],
      ),
    );
  }
  Widget _mineItem(String imageName, String title){
    return InkWell(
      onTap: (){
        this.onTop();
      },
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: Image.asset(imageName, width: 30,height: 30.0,),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),

            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/***
 * 有状态的部件
 *
 * */
class Mine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text("我的", style: new TextStyle(color: Colors.white),),
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
            elevation: 0,
            brightness: Brightness.light,
          ),
          body: ListView(
            children: <Widget>[
              _MineHeader,
              _listViewLine2,
              _listViewLine,
              MineItemWidget("images/icservice.png", "联系客服", onTop: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListImage()));
              }),
              MineItemWidget("images/ic_mine_trade.png", "发布记录", onTop: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Record()));
              }),
              MineItemWidget("images/ic_mine_setting.png", "设置", onTop: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
              }),
            ],
          ),
        ),
      ),
    );
    //

  }

  Widget get _listViewLine{
    return Container(
      color: Color(0xffe0e0e0),
      height: 1,
    );
  }
  Widget get _listViewLine2{
    return Container(
      color: Colors.white,
      height: 10,
    );
  }
  /**个人中心头部*/
  Widget get _MineHeader{
    return Container(
      color: Colors.deepOrange,
      height: 150,
      padding: new EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: new Image.asset(
              "images/fire.jpg",
              width: 65.0,
              height: 65.0,
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            padding:const EdgeInsets.only(left: 8.0),
            child: Text("你的名字",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20
                )
            ),
          )

        ],
      ),
    );
  }
}

























