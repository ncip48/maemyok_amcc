import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      body: WebviewScaffold(
        appBar: AppBar(
          title: Text(arguments['title']),
        ),
        url: arguments['url'],
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
