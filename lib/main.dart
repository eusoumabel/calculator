import 'package:calculator_final/view/SplashView/splash.view.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'AllerDisplay'),
      home: SplashView(),
    ),
  );
}