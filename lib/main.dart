import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'credit_card_page.dart';
import 'introduction_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IntroScreen(),
      ),
    );
  }
}
