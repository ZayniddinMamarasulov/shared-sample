import 'package:flutter/material.dart';
import 'package:shared_sample/home_page.dart';
import 'package:shared_sample/local_data/storage_repository.dart';
import 'package:shared_sample/login_page.dart';
import 'package:shared_sample/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
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
