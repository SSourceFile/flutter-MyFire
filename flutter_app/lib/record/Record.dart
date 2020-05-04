import 'package:flutter/material.dart';
import 'package:flutterapp/data/protocol/models.dart';
import 'package:flutterapp/data/repository/wan_repository.dart';
import 'package:flutterapp/widgetTools/Toolbar.dart';

class Record extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecordState();
  }
}

class RecordState extends State {
  @override
  void initState() {
    super.initState();
    _getBanner();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: Toolbar.toolbar('约炮记录'),
      body: new Container(
        child:  new Center(
          child: Text('约你妹的，就不好好学习'),
        ),
      ),
    );
  }

  void _getBanner() {

  }
}
