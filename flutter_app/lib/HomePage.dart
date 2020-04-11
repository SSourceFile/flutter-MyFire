import 'package:flutter/material.dart';
import 'package:flutterapp/homeData/HomeItemData.dart';
import 'package:flutterapp/data/repository/MeiziBean.dart';

class HomePage extends StatelessWidget{
// Widget _getListData(context, index){
////    var list = listData.map((value){
//      return ListTile(
//        title: Text(listData[index]["title"]),
//        leading: Image.network(listData[index]["imageUrl"]),
//        subtitle: Text(listData[index]["author"]),
//      );
////    });
////    return ;
//  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: MeiziBean().listData.length,
      itemBuilder: this._getListData,
    );
  }

 Widget _getListData(BuildContext context, int index){
   return Container(
     child: new Column(
       children: <Widget>[
         new Image.network(MeiziBean().listData[index]["imageUrl"], height: 500,width: 600.0, fit: BoxFit.fill,),
         _whiteLine,
         new Text(MeiziBean().listData[index]["title"], style:  TextStyle(fontSize: 20, color: Colors.blueAccent),),
         _whiteLine,
       ],
     ),
   );
 }
 Widget get _whiteLine{
   return new Container(

     height: 15,
   );
 }

}