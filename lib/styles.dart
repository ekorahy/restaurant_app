import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
const Color primaryColor = Color(0xFFFFA500);
const Color secondaryColor = Color(0xFF6B38FB);
const Color goldColor = Color(0xFFFFD700);

final myTextTheme = TextTheme(
  headline1: GoogleFonts.quicksand(
    fontSize: 98,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5
  ),
  headline2: GoogleFonts.quicksand(
    fontSize: 61,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5
  ),
  headline3: GoogleFonts.quicksand(
    fontSize: 49,
    fontWeight: FontWeight.w400
  ),
  headline4: GoogleFonts.quicksand(
    fontSize: 35,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25
  ),
  headline5: GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w400
  ),
  headline6: GoogleFonts.quicksand(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15
  ),
  subtitle1: GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15
  ),
  subtitle2: GoogleFonts.quicksand(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.1
  ),
  bodyText1: GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.5
  ),
  bodyText2: GoogleFonts.roboto(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25
  ),
  button: GoogleFonts.roboto(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  letterSpacing: 1.25
  ),
  caption: GoogleFonts.roboto(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.4
  ),
  overline: GoogleFonts.roboto(
  fontSize: 10,
  fontWeight: FontWeight.w400,
  letterSpacing: 1.5
  ),
);