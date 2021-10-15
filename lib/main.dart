import 'package:flutter/material.dart';
import 'package:practica3/pages/splash_page.dart';
import 'package:practica3/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.SPLASH_SCREEN,
      routes: {
        Routes.SPLASH_SCREEN: (context) => SplashPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
