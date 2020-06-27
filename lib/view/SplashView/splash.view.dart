import 'package:calculator_final/view/HomeView/home.view.dart';
import 'package:calculator_final/view/SplashView/splash.view.styles.dart';
import 'package:flutter/material.dart';
import 'dart:async';

SplashViewStyles sps = new SplashViewStyles();

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override

  ///The thing that makes the splashView a SplashScreen
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(87, 161, 165, 1),
      body: Container(),
    );
  }
}
