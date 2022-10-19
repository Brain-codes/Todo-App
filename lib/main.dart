// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/account_edit.dart';
import 'package:todo_app/pages/onboarding_screen.dart';
import 'data/database.dart';
import 'pages/home_page.dart';

void main() async {
  //INITIALIZING HIVE FOR OUR APP
  await Hive.initFlutter();
  //OPEN THE BOX - LIKE A REPRESENTATION OF OUR DATABASE
  await Hive.openBox("myBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  TodoDataBase db = TodoDataBase();
  final _myBox = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF250b5a),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          _myBox.get('ONBOARDING') == true ? AccountEdit() : OnBoardingScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF050A18),
      ),
    );
  }
}
