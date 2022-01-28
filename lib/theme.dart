import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  textTheme : TextTheme(
    headline1: GoogleFonts.prozaLibre(
        fontSize: 98,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5
    ),
    headline2: GoogleFonts.prozaLibre(
        fontSize: 61,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5
    ),
    headline3: GoogleFonts.prozaLibre(
        fontSize: 49,
        fontWeight: FontWeight.w400
    ),
    headline4: GoogleFonts.prozaLibre(
        fontSize: 35,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25
    ),
    headline5: GoogleFonts.prozaLibre(
        fontSize: 24,
        fontWeight: FontWeight.w400
    ),
    headline6: GoogleFonts.prozaLibre(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15
    ),
    subtitle1: GoogleFonts.prozaLibre(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15
    ),
    subtitle2: GoogleFonts.prozaLibre(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1
    ),
    bodyText1: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5
    ),
    bodyText2: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25
    ),
    button: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25
    ),
    caption: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4
    ),
    overline: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5
    ),
  ),
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  primarySwatch: Colors.amber,
  primaryColor: Colors.amber[600],
  primaryColorLight: Colors.amber[200],
  primaryColorDark: Colors.amber[700],
  errorColor: Colors.red[800],
);
