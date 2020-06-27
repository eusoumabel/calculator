import 'package:flutter/material.dart';

class SplashViewStyles {
  Color backgroungColor = Color.fromRGBO(87, 161, 165, 1);

  Container background() {
    String image = 'assets/images/background.png';
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container logo() {
    String image = 'assets/images/name.png';
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
