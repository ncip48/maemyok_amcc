import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maemyok_amcc/routes/app_routes.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -130,
            left: -50,
            right: -50,
            child: Image.asset('assets/image_1.png'),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                Text(
                  'Maem Yok!',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Maem yok adalah aplikasi sederhana untuk menampilkan daftar makanan dan deskripsinya',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 34,
            left: 0,
            right: 0,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.Home);
              },
              child: Container(
                width: 215,
                decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mulai',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                          )),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
