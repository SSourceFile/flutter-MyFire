import 'package:flutter/material.dart';

class Toolbar{

  Widget toolbar(String title, {Boolean isCenterTitle = true}){
    return new AppBar(
      title: Text(title, style: new TextStyle(color: Colors.white),),
      centerTitle: true,
      iconTheme: new IconThemeData(
          color: Colors.white
      ),
    );
  }
}