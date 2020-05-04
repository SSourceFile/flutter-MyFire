import 'package:flutter/material.dart';
import 'package:flutterapp/widgetTools/Toolbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebView extends StatefulWidget{
  dynamic itemData;
  BaseWebView(itemData){
    this.itemData = itemData;
  }

  @override
  State<StatefulWidget> createState() {
    return WebViewState(itemData);
  }

}

class WebViewState extends State{
  dynamic data;
  WebViewState(itemData){
    data = itemData;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic data = ModalRoute.of(context).settings.arguments;
    dynamic _controller;
    String _title;
    return Scaffold(
        appBar: Toolbar.toolbar("webview"),
        body: new WebView(
          initialUrl: this.data,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageFinished: (url) {
            _controller.evaluateJavascript("document.title").then((result){
              setState(() {
                _title = result;
              });
            }
            );
          },
        ),
      );


  }

}