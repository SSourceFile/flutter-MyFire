import 'package:flutter/material.dart';
import 'package:flutterapp/data/protocol/models.dart';
import 'package:flutterapp/data/repository/wan_repository.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

class Record extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: Toolbar.toolbar("记录"),
      body: Container(
        child: new Text("选择"),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return RecordState();
  }
}

class RecordState extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBanner();
  }
  @override
  Widget build(BuildContext context) {

    return new StreamBuilder();
  }

  void _getBanner() {
//    AsyncSnapshot <List<BannerModel>> list = WanRepository().getBanner();


  }
}
