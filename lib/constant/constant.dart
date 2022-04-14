import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const coklat = Color(0xFF333333);
const orange = Color(0xFFFF594F);
const background = Color(0xFFF6FAFC);
const merah = Colors.redAccent;
const putih = Colors.white;

TextStyle ukuran1 =
    GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w300);
TextStyle ukuran2 =
    GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700);
TextStyle appBarText = GoogleFonts.poppins(
    fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);
TextStyle titleTab =
    GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal);

abstract class Config {
  static const URL = "https://api.juber.co.id:9300/";
  static const TOKEN =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Ik5DSVAiLCJpZCI6IkpCMzAwMyIsImlhdCI6MTY0OTY3OTI5NCwiZXhwIjoxNjUwODg4ODk0fQ._79tKNIuxNpiUDyaUwZrg-38yNa8Q_z3-6SPIBT34iU';
  static const UUID = 'a8a0182291acac77';
  static const IRSAUTH = '08c9b11f3b4e6723542e61edd88d967b';
  static const IDRS = "JB3003";
}
