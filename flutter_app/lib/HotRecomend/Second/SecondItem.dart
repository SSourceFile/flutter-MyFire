

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondItem extends StatefulWidget{
  dynamic data;
  SecondItem(this.data, {Key key}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return SecondItemSate(data);
  }

}

class SecondItemSate extends State{
  dynamic itemData;
  SecondItemSate(data){
    this.itemData = data;
  }



  @override
  Widget build(BuildContext context) {
    List<Widget> rightWidgetList = [];

    rightWidgetList.add(
      Text(
        itemData["title"],
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        //只展示一行
        maxLines: 1,
        //超出一行 显示...
        overflow: TextOverflow.ellipsis,
      ),
    );
    return new Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Container(
              height: 70,
              width: 120,
              child: Center(
                child: new Image.asset('images/ic_home_head.jpg',width: 120.0, height: 80.0, fit: BoxFit.cover,)
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rightWidgetList,
              ),
            )
          ],
        ),
      ),
    );
  }

}