// ignore_for_file: deprecated_member_use, import_of_legacy_library_into_null_safe, unnecessary_statements
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
// import 'dart:developer';
import 'package:shimmer/shimmer.dart';
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // const HomePage({Key? key}) : super(key: key);

  get namaUser => 'Herly Chahya';
  bool _loading = true;

  //fetch api product
  List<Product> _productList = [];
  Future<List<Product>> fetchProducts() async {
    log('hit me');
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
    setState(() {
      _loading = false;
    });
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
    _loading = true;
    futureProduct = fetchProducts();
    futureBanner = fetchBanner();
    futureProfile = fetchProfile();

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

  Future refreshData() async {
    log('refreshed');
    setState(() {
      _loading = true;
    });
    futureProduct = fetchProducts();
    futureBanner = fetchBanner();
    futureProfile = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background,
        child: RefreshIndicator(
          onRefresh: refreshData,
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
                              if (!snapshot.hasData || _loading) {
                                return SizedBox(
                                  width: 150.0,
                                  height: 24.0,
                                  child: Shimmer.fromColors(
                                    baseColor: Color(0xFFEBEBF4),
                                    highlightColor: Color(0xFFF4F4F4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEBEBF4),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      width: 40.0,
                                      height: 0,
                                    ),
                                  ),
                                );
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
                        _loading
                            ? null
                            : Navigator.pushNamed(context, Routes.Profile);
                      },
                      child: _loading
                          ? SizedBox(
                              width: 48,
                              height: 48,
                              child: Shimmer.fromColors(
                                baseColor: Color(0xFFEBEBF4),
                                highlightColor: Color(0xFFF4F4F4),
                                child: Container(
                                  // padding: EdgeInsets.only(right: 100),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEBEBF4),
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  width: 48,
                                  height: 0,
                                ),
                              ),
                            )
                          : Container(
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
                    color: putih,
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
                    if (!snapshot.hasData || _loading) {
                      return SizedBox(
                        width: double.infinity,
                        height: 124.0,
                        child: Shimmer.fromColors(
                          baseColor: Color(0xFFEBEBF4),
                          highlightColor: Color(0xFFF4F4F4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBF4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: 40.0,
                            height: 0,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('${snapshot.error}'));
                    }
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        BannerEntity banner = snapshot.data![index];
                        return ListBanner(image: banner.image);
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
                  indicatorColor: orange,
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
                    if (!snapshot.hasData || _loading) {
                      return SizedBox(
                        width: double.infinity,
                        height: 260.0,
                        child: Shimmer.fromColors(
                          baseColor: Color(0xFFEBEBF4),
                          highlightColor: Color(0xFFF4F4F4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBF4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: 40.0,
                            height: 0,
                          ),
                        ),
                      );
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
      ),
    );
  }
}
