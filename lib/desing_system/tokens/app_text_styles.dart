import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTextStyles {
  static final TextStyle h1 = GoogleFonts.montserrat(
    fontSize: 64,
    fontWeight: FontWeight.w800,
    height: 1.1,
  );

  static final TextStyle h2 = GoogleFonts.montserrat(
    fontSize: 44,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static final TextStyle h3 = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static final TextStyle body = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static final TextStyle small = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final TextStyle button = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
