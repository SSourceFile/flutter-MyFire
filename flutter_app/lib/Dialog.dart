import 'package:flutter/material.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

class Dialogs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DialogState();
  }
}

class DialogState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Toolbar.toolbar("弹窗测试"),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                _askedToLead();
              },
              child: Text(
                "弹窗",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.cyan,
                    fontStyle: FontStyle.italic),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                _neverSatisfied();
              },
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF5DEA65),
                      Color(0xFF99EAEA),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),

                child: const Text('色秘密mimis',
                    style: TextStyle(fontSize: 20)),
              ),
            )
          ],
        ),
      ),
    );
  }

  //SimpleDialog
  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('对于18岁用户谨慎进入'),
                Text('接来下的信息将会打开你的大脑世界，请备好纸巾'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //AlertDialog
  Future<void> _askedToLead() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('按F键进入坦克'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
//                  Navigator.pop(context, Department.treasury);
                  Navigator.of(context).pop();

                },
                child: const Text('取消'),
              ),
              SimpleDialogOption(
                onPressed: () {
//                  Navigator.pop(context, Department.state);
                  Navigator.of(context).pop();
                  },
                child: const Text('确定'),
              ),
            ],
          );
        }
    );
  }


}
