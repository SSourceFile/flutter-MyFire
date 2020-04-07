import 'package:flutter/material.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';
class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new Toolbar().toolbar,
      body: Container(
        child: new Text("设置页面"),
      ),
    );
  }

}

















