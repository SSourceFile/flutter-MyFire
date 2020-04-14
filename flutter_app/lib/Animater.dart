import 'package:flutter/material.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

/**
 *
 * */
class Animater extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimaterState();
  }
}

class AnimaterState extends State{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Toolbar.toolbar("动画"),
      body: new Row(
        children: <Widget>[
          Text("动画")
        ],
      ),
    );
  }

}