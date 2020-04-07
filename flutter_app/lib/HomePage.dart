import 'package:flutter/material.dart';
import 'package:flutterapp/homeData/HomeItemData.dart';


class HomePage extends StatelessWidget{
 Widget _getListData(context, index){
//    var list = listData.map((value){
      return ListTile(
        title: Text(listData[index]["title"]),
        leading: Image.network(listData[index]["imageUrl"]),
        subtitle: Text(listData[index]["author"]),
      );
//    });
//    return ;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: this._getListData,
      itemCount: listData.length,);
  }

}