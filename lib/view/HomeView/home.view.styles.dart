import 'package:flutter/material.dart';

class HomeViewStyles {
  Color backgroundColor = Colors.white;

  Container resultBackground() {
    Color color = Color.fromRGBO(234, 234, 234, 1);
    Radius radius = Radius.circular(50);
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: radius,
          bottomRight: radius,
        ),
      ),
    );
  }
}
