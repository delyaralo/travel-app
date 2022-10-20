import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: double.infinity,
        // backgroundColor: Colors.red,
        splash: Image.asset(
          'assets/ezgif.com-gif-maker.gif',
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        nextScreen: HomePage(),
      ),
    );
  }
}
