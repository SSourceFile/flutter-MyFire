
import 'package:flutter/material.dart';

class ListImage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "这个是新的页面",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              new Text(
                "诶呦，这妹子不错哦，你说呢",
                style: new TextStyle(
                  color: Colors.blue,
                ),
              )
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red,
          ),
          new Text("14")
        ],
      ),
    );
    Column getText(IconData icon, String text){
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: Colors.brown,),
          new Container(margin: const EdgeInsets.only(top: 8.0),
          child: new Text(text, style: new TextStyle(color: Colors.brown[500]),),)
        ],
      );
    }

    //实现按钮部分
    Widget buttonSelection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          getText(Icons.call, "CALL"),
          getText(Icons.near_me, "ROUTE"),
          getText(Icons.share, "SHARE")
        ],
      ),
    );

    Widget textSelect = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        "露娜，技能吊炸天，就怕不飞天，打野死坑死坑了，还有谁？在下刘茜茜，左手一撸李元芳，右手一撸马超", softWrap: true,
      ),
    );
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: Text("发财了"),),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/fire.jpg",
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSelection,
            textSelect
          ],
        ),
      ),
    );
  }

}