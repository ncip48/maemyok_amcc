// ignore_for_file: deprecated_member_use, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:maemyok_amcc/constant/constant.dart';
import 'package:maemyok_amcc/pages/HistoryPage.dart';
import 'package:maemyok_amcc/pages/HomePage.dart';
import 'package:maemyok_amcc/pages/Profile.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  _HomeNavigator createState() => _HomeNavigator();
}

class _HomeNavigator extends State<HomeNavigator> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 75,
          decoration: BoxDecoration(
            color: coklat,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: coklat,
              selectedItemColor: putih,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.white70,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  activeIcon: Icon(Icons.shopping_bag),
                  label: 'Pesanan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_outlined),
                  activeIcon: Icon(Icons.chat),
                  label: 'Chat',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[HomePage(), HistoryPage(), ProfileView()],
        ));
  }
}
