import 'package:flutter/material.dart';
import 'package:flutterapp/widgetTools/Toaster.dart';

class ThreeGridItem extends StatefulWidget {
  dynamic itemData;

  ThreeGridItem(data) {
    this.itemData = data;
    print(data);
  }

  @override
  State<StatefulWidget> createState() {
    return ThreeGridState(itemData);
  }
}

class ThreeGridState extends State {
  dynamic itemData;

  ThreeGridState(itemData) {
    this.itemData = itemData;
  }

  Widget descData(data) {
    return new Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),

      child: Text(itemData['desc']),

//
    );
  }

  Widget imageData() {
    return Image.network(
      itemData['images'][0],
      height: 210,
      width: 230,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Card(
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Flexible(
            child: Column(
              children: <Widget>[
                imageData(),
                bottomData(itemData),
                Expanded(
                  child: descData(itemData),
                )
              ],
            ),
          )
//
          ),
    );
  }

  Widget bottomData(data) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.network(
              data['images'][0],
              width: 40,
              height: 40,
            ),
          ),
          new Container(child: Text(itemData['author']))
        ],
      ),
    );
  }
}
