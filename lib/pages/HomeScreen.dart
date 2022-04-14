// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maemyok_amcc/components/ListBanner.dart';
import 'package:maemyok_amcc/components/ListMenu.dart';
import 'package:maemyok_amcc/constant/constant.dart';
import 'package:maemyok_amcc/entity/BannerEntities.dart';
import 'package:maemyok_amcc/entity/ProductEntities.dart';
import 'package:maemyok_amcc/entity/ProfileEntities.dart';
import 'package:maemyok_amcc/routes/app_routes.dart';
import 'package:http/http.dart' as http;
import 'package:worm_indicator/indicator.dart';
import 'package:worm_indicator/shape.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  // const HomeScreen({Key? key}) : super(key: key);

  get namaUser => 'Herly Chahya';

  //fetch api product
  List<Product> _productList = [];
  Future<List<Product>> fetchProducts() async {
    final response = await http.post(
      Uri.parse('https://api.juber.co.id:9300/apps/jbdelivery/post'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + Config.TOKEN,
        'irsauth': Config.IRSAUTH
      },
      body: jsonEncode(<String, String>{
        'uuid': Config.UUID,
        'key': 'getbarangbykategori',
        'payload': '{\"idkategori\":\"abcdefaaaa\"}'
      }),
    );
    if (response.statusCode == 200) {
      // log(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> values = map["data"]['lobj'];
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            _productList.add(Product.fromJson(map));
            // log('Id-------${map['id']}');
          }
        }
      }
      // log(_productList.toString());
      return _productList;
    } else {
      throw Exception('Failed to load product');
    }
  }

  //fetch api banner
  List<BannerEntity> _bannerList = [];
  Future<List<BannerEntity>> fetchBanner() async {
    final response = await http.post(
      Uri.parse(Config.URL + 'apps/utilities/sliders'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + Config.TOKEN,
        'irsauth': Config.IRSAUTH
      },
      body: jsonEncode(<String, String>{
        'uuid': Config.UUID,
        'key': 'getbarangbykategori',
        'payload': '{\"idkategori\":\"abcdefaaaa\"}'
      }),
    );
    if (response.statusCode == 200) {
      // log(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> values = map["data"]['sliders'];
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            _bannerList.add(BannerEntity.fromJson(map));
            // log('Id-------${map['id']}');
          }
        }
      }
      // log(_productList.toString());
      return _bannerList;
    } else {
      throw Exception('Failed to load product');
    }
  }

  //fetch api profile
  Future<Profile> fetchProfile() async {
    final response = await http.post(
      Uri.parse('https://api.juber.co.id:9300/apps/users/getprofile'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + Config.TOKEN,
        'irsauth': Config.IRSAUTH
      },
      body: jsonEncode(
          <String, String>{'uuid': Config.UUID, 'idrs': Config.IDRS}),
    );
    // log(response.body);
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

  late Future<List<Product>> futureProduct;
  late Future<List<BannerEntity>> futureBanner;
  late Future<Profile> futureProfile;

  int _currentPage = 0;
  late Timer _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProducts();
    futureProfile = fetchProfile();
    futureBanner = fetchBanner();

    //banner berjalan
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: 75,
        decoration: BoxDecoration(
            color: coklat, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.Home),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home, color: putih),
                    Text(
                      'Beranda',
                      style: GoogleFonts.poppins(color: putih),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.Profile),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: putih),
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(color: putih),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: background,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<Profile>(
                          future: futureProfile,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: Text('Loading'));
                            }

                            if (snapshot.hasError) {
                              return Center(child: Text('${snapshot.error}'));
                            }

                            return Text(
                              'Hai, ' + snapshot.data!.namareseller,
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Mau makan apa \nhari ini?',
                            style: GoogleFonts.poppins(
                                fontSize: 22, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  // foto-profil
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.Profile);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: orange,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/herly.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // form-search
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              // height: 59,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: coklat,
                ),
                color: putih,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Cari Makanan',
                  hintStyle: GoogleFonts.poppins(),
                ),
              ),
            ),
            SizedBox(height: 30),
            // banner
            Container(
              width: double.infinity,
              height: 124,
              child: FutureBuilder<List<BannerEntity>>(
                future: futureBanner,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading'));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return PageView.builder(
                    controller: _pageController,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      BannerEntity banner = snapshot.data![index];
                      return Column(
                        children: [
                          ListBanner(image: banner.image),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: WormIndicator(
                length: 3,
                controller: _pageController,
                indicatorColor: merah,
                shape: Shape(
                    size: 8,
                    spacing: 8,
                    shape: DotShape.Circle // Similar for Square
                    ),
              ),
            ),
            Container(
              height: 260,
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
              child: FutureBuilder<List<Product>>(
                future: futureProduct,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading'));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      Product products = snapshot.data![index];
                      return Column(
                        children: [
                          ListMenu(
                            label: products.name,
                            desc: products.type,
                            price: products.price.toString(),
                            to: Routes.Detail,
                            img: products.image,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
