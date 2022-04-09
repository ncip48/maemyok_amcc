import 'package:get/get.dart';
import 'package:maemyok_amcc/pages/DetailItem.dart';
import 'package:maemyok_amcc/pages/GetStarted.dart';
import 'package:maemyok_amcc/pages/HomeScreen.dart';
import 'package:maemyok_amcc/pages/Profile.dart';
import 'package:maemyok_amcc/pages/WebView.dart';
import 'package:maemyok_amcc/routes/app_routes.dart';

class AppPages {
  static const Initial = Routes.Root;

  static final routes = [
    GetPage(name: Routes.Root, page: () => GetStarted()),
    GetPage(name: Routes.Home, page: () => HomeScreen()),
    GetPage(name: Routes.Detail, page: () => DetailItem()),
    GetPage(name: Routes.Profile, page: () => ProfileView()),
    GetPage(name: Routes.WebView, page: () => WebView()),
  ];
}
