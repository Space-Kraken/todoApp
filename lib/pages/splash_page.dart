import 'package:flutter/material.dart';
import 'package:practica3/pages/home_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomePage(),
      duration: 5000,
      text: 'AntyLazy app',
      backgroundColor: Colors.blueGrey,
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      colors: [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
      ],
    );
  }
}
