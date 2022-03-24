import 'package:flutter/material.dart';
import 'package:maemyok_amcc/pages/GetStarted.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Maem Yok',
      home: GetStarted(),
    );
  }
}
