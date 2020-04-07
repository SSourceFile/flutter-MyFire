import 'package:flutter/material.dart';

class Record extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("发布记录", style: new TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: new IconThemeData(
            color: Colors.white
        ),
      ),
      body: Container(
        child: new Text("发布"),
      ),
    );
  }

}