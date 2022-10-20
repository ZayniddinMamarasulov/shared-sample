import 'package:flutter/material.dart';
import 'package:shared_sample/home_page.dart';
import 'package:shared_sample/login_page.dart';
import 'package:shared_sample/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
    );
  }
}
