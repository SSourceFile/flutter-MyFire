import 'package:flutter/material.dart';

class Toolbar{
  static Widget toolbar(String title, {bool isCenterTitle = true}){
    return new AppBar(
      title: Text(title, style: new TextStyle(color: Colors.white),),
      centerTitle: true,
      iconTheme: new IconThemeData(
          color: Colors.white
      ),
    );
  }
}