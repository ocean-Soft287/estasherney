import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color mainColor = Color(0xFF4D1BD8);
  static const Color textcColor = Color(0xFF321485);
  static const Color wightcolor = Color(0xffFFFFFF);
  static const Color greyColor = Color(0xFF252525);
  static const Color blackColor = Color(0xFF000000);
  static const Color grycolor = Color(0xff979797);
  static const Color whitegradient=Color(0xff33E4DB);
  static const Color accentcolor = Color(0xff1F1E22);
  static const LinearGradient blueGradient = LinearGradient(
    colors: [mainColor, whitegradient],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
