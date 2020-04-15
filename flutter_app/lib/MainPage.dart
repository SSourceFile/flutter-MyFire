import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Mine.dart';
import 'package:flutterapp/CategoryPage.dart';
import 'package:flutterapp/HomePage.dart';
import 'package:flutterapp/toolbar/Toolbar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Tab(),
    );
  }
}

class Tab extends StatefulWidget {
  _TabState createState() => _TabState();
}

class _TabState extends State {
  int _currentIndex = 0;
  PageController _pageController;

  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  List<Widget> _pageList = [HomePage(), CategoryPage(), Mine()];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        body: PageView(
          controller: this._pageController,
          children: this._pageList,
          physics: new NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('分类')),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的'))
          ],
          currentIndex: this._currentIndex,
          onTap: (index) {
            this.setState(() {
              this._currentIndex = index;
              this._pageController.jumpToPage(this._currentIndex);
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
        ),
      ),
    );
  }
}
