import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebviewScaffold(
        appBar: AppBar(
          title: Text('LinkedIn'),
        ),
        url: 'https://www.linkedin.com/in/herly-chahya/',
        initialChild: Container(
          color: Colors.white,
          child: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}
