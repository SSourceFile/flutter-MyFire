import 'package:flutter/material.dart';
import 'package:flutterapp/widgetTools/Toolbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WebViewState();
  }

}

class WebViewState extends State{
  @override
  Widget build(BuildContext context) {
    final dynamic data = ModalRoute.of(context).settings.arguments;
    dynamic _controller;
    String _title;
    return new Scaffold(
      appBar: Toolbar.toolbar("webview"),
      body: new WebView(
        initialUrl: data,
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