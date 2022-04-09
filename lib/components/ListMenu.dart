import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maemyok_amcc/constant/constant.dart';

class ListMenu extends StatelessWidget {
  final String label;
  final String desc;
  final String price;
  final String to;
  final String img;

  ListMenu(
      {required this.label,
      required this.desc,
      required this.price,
      required this.to,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 260,
      width: 190,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(to);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: putih,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 190,
                width: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      desc,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      price,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              height: 142,
              width: 142,
              child: Image.asset(img),
            ),
          ),
        ],
      ),
    );
  }
}
