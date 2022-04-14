import 'package:flutter/material.dart';
import 'package:maemyok_amcc/constant/constant.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: orange,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black,
              labelStyle: titleTab,
              tabs: [
                Tab(
                  text: 'Pesanan Baru',
                ),
                Tab(
                  text: 'Pesanan Lama',
                ),
              ],
            ),
            backgroundColor: background,
            elevation: 1,
            centerTitle: true,
            title: Text(
              'Pesanan Saya',
              style: appBarText,
            ),
          ),
          body: const TabBarView(
            children: [
              Pesanan(),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}

class Pesanan extends StatefulWidget {
  const Pesanan({Key? key}) : super(key: key);

  @override
  _PesananState createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
