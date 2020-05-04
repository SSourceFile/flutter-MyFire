import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/HotRecomend/three/ThreeGridItem.dart';
import 'package:flutterapp/data/api/HttpRequest.dart';
import 'package:flutterapp/data/api/apis.dart';
import 'package:flutterapp/widgetTools/Toaster.dart';

class ThreeCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThreeCategoryState();
  }
}

class ThreeCategoryState extends State {
  dynamic data = [];

  @override
  void initState() {
    _getMeiziData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new GridView.builder(
            shrinkWrap: true,
            itemCount: data.length,
//            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 5),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.7),
            itemBuilder: (context, index) {
              return ThreeGridItem(data[index]);
            }));
  }

  void _getMeiziData() async {
    Net.instance.get(WanAndroidApi.MEIZIAPI, null, success: (data) {
      setState(() {
        this.data = data;
      });

//      Toaster.show('数据' + this.data.length.toString());
    }, failure: (err) {
      Toaster.show(err.toString());
    });
  }
}
