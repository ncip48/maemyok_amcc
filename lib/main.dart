import 'package:flutter/material.dart';
import 'package:maemyok_amcc/pages/DetailItem.dart';
import 'package:maemyok_amcc/pages/GetStarted.dart';
import 'package:maemyok_amcc/pages/HomeScreen.dart';
import 'package:maemyok_amcc/pages/Profile.dart';
import 'package:maemyok_amcc/pages/ProfileScreen.dart';
import 'package:maemyok_amcc/pages/WebView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Makan Yok',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => GetStarted(),
          '/homepage': (context) => HomeScreen(),
          '/detail': (context) => DetailItem(),
          '/profile': (context) => ProfileView(),
          '/webview': (context) => WebView(),
        });
  }
}
