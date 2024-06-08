import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:evaluation_task_ecommerce/Screens/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MainApp());
}

var myTheme = ThemeData(
  colorScheme: lightColorScheme,
  primaryColor: lightColorScheme.primary,
  textTheme: GoogleFonts.montserratTextTheme(),
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fade,
      home: const SplashScreen(),
      theme: myTheme,
    );
  }
}

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
