import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMAN PHONE',
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.red)),
      home: MyHomePage(),
    );
  }
}
