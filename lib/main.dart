// @dart=2.9
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:maemyok_amcc/routes/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Makan Yok',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.Initial,
      getPages: AppPages.routes,
    );
  }
}
