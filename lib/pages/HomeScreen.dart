import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maemyok_amcc/components/ListMenu.dart';
import 'package:maemyok_amcc/constant/constant.dart';
import 'package:maemyok_amcc/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get namaUser => 'Herly Chahya';

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
                        Text('Hai, $namaUser',
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w400)),
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
              margin: EdgeInsets.symmetric(horizontal: 25),
              height: 124,
              child: PageView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: putih,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/banner.png')),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: putih,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/banner.png')),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: putih,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/banner.png')),
                    ),
                  ),
                ],
              ),
            ),
            // menu
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              height: 260,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ListMenu(
                      label: 'Pecel Sayur 1',
                      desc: 'Ini adalah pecel sayur',
                      price: 'USD 14',
                      to: Routes.Detail,
                      img: 'assets/pecel-sayur.png',
                    ),
                    ListMenu(
                      label: 'Pecel Sayur 2',
                      desc: 'Ini adalah pecel sayur',
                      price: 'USD 14',
                      to: Routes.Detail,
                      img: 'assets/pecel-sayur.png',
                    ),
                    ListMenu(
                      label: 'Pecel Sayur',
                      desc: 'Ini adalah pecel sayur',
                      price: 'USD 14',
                      to: Routes.Detail,
                      img: 'assets/pecel-sayur.png',
                    ),
                    ListMenu(
                      label: 'Pecel Sayur',
                      desc: 'Ini adalah pecel sayur',
                      price: 'USD 14',
                      to: Routes.Detail,
                      img: 'assets/pecel-sayur.png',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
