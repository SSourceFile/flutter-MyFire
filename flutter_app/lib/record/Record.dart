import 'package:flutter/material.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

class Record extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: Toolbar.toolbar("约炮记录"),
      body: Container(
        child: new Text("您还没有约炮记录，请回到首页选择"),
      ),
    );
  }

}