import '/Services/api_service.dart';
import '/Services/storage_service.dart';
import '/translations/intl_en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '/screens/splash_screen.dart';
import 'theme/theme_data.dart';

void main() async {
  Get.put(ApiService());
  Get.put(StorageService());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      locale: const Locale("en"),
      translations: Localization(),
      defaultTransition: Transition.fade,
      home: SplashScreen(),
      theme: myTheme,
    );
  }
}
