import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var myTheme = ThemeData(
  colorScheme: lightColorScheme,
  primaryColor: lightColorScheme.primary,
  textTheme: GoogleFonts.montserratTextTheme(),
);

const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xfff89939),
    onPrimary: Colors.white,
    secondary: Color(0xfff2673a),
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black87,
    brightness: Brightness.light);
