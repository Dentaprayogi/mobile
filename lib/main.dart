import 'package:flutter/material.dart';
import 'unbording.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    home: SplashScreenPage(),
  ));
}