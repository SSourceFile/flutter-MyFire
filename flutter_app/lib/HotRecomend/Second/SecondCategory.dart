

import 'package:flutter/material.dart';
import 'package:flutterapp/HotRecomend/Second/SecondItem.dart';
import 'package:flutterapp/common/common.dart';
import 'package:flutterapp/data/api/HttpRequest.dart';
import 'package:flutterapp/data/api/apis.dart';
import 'package:flutterapp/widgetTools/Toaster.dart';

class SecondCategory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SecondCategoryState();
  }
}
class SecondCategoryState extends State{

  dynamic data = [];
  @override
  void initState() {
    super.initState();
    getWeiChatData();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return SecondItem(this.data[index]);
              })
          )

      ),
    );
  }

  void getWeiChatData() async {
    Net.instance.get(Constant.wan_android+WanAndroidApi.WXARTICLE_LIST_JSON, null, success: (data){
      setState(() {
        this.data =  data["datas"];
      });
    }, failure: (err){
      Toaster.show(err.toString());
    });
  }
}