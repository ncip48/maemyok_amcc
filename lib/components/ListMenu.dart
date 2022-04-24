import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maemyok_amcc/constant/constant.dart';
import 'package:maemyok_amcc/helper/helper.dart';

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
                      label.length < 15
                          ? label
                          : label.substring(0, 15) + '...',
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
                      formatRupiah(int.parse(price)),
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
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: orange,
                ),
              ),
              child: img.contains('http')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: Image.network(
                        img,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(img),
            ),
          ),
        ],
      ),
    );
  }
}
