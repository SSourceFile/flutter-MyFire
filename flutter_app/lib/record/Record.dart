import 'package:flutter/material.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

class Record extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: Toolbar.toolbar("发布记录"),
      body: Container(
        child: new Text("发布"),
      ),
    );
  }

}