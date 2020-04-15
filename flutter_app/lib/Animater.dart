import 'package:flutter/material.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

/**
 * 动画学习
 * */
class Animater extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimaterState();
  }
}

class AnimaterState extends State with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation cur;
  Animation<double> tween;
  @override
  void initState() {
    super.initState();
    //添加动画控制器
    controller = new AnimationController(vsync: this, duration: const Duration(seconds: 3));
    //新建非线性动画  Curves：差值器
    cur = new CurvedAnimation(parent: controller, curve: Curves.bounceOut);
//    tween = new Tween(begin: 0.0, end: 1.0).animate(controller);
//    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Toolbar.toolbar("动画"),
      body: new Column(
        children: <Widget>[
          new Container(
            child:
            new RotationTransition(turns: cur, child: FlutterLogo(size: 200,),),
          ),
          new GestureDetector(
            onTap: (){
              startAnimation();
            },
            child: new Center(
              child: Text("福禄特，搜啥 啊啊", style: TextStyle(fontSize: 20),),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
//          controller.reverse();
        //触发动画效果
          controller.repeat();
        },
      ),
    );
  }

  void startAnimation() {
    setState(() {
      controller.forward(from: 20.0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

}