import 'package:classified_ads/api/categories_api.dart';
import 'package:classified_ads/screens/Tabs/settings_tab.dart';
import 'package:classified_ads/screens/home_screen.dart';
import 'package:classified_ads/screens/login_screen.dart';
import 'package:classified_ads/screens/onboarding_screen.dart';
import 'package:classified_ads/screens/signup_screen.dart';
import 'package:classified_ads/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(ClassifiedsApp());
}

CategoriesApi categoriesApi = CategoriesApi();

class ClassifiedsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      title: 'Classifieds App',
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/settings': (context) => SettingsTab(),
      },
    );
  }
}
