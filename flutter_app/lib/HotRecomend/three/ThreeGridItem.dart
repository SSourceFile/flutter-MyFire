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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        child: Column(
          children: <Widget>[
            Image.network(
              itemData['images'][0],
              height: 210,
              width: 230,
              fit: BoxFit.cover,
            ),
            Text(itemData['author'])
          ],
        ),
      ),
    );
  }
}
