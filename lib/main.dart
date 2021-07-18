import 'package:flutter/material.dart';
import 'package:smart_home_ui/SplashScrean.dart';

import 'package:smart_home_ui/page_one.dart';
import 'package:flutter/services.dart';
import 'package:smart_home_ui/pages/HEATER.dart';
import 'package:smart_home_ui/pages/outside.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScrean(),
    );
  }
}
