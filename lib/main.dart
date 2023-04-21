import 'dart:convert';

import 'package:api_tutorial/api_example7.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Model/post_model.dart';
import 'api_ex1.dart';
import 'api_ex2.dart';
import 'api_example6.dart';
//import 'api_ex3.dart';
//import 'api_example5.dart';
//import 'api_example4.dart';
//import 'api_example3.dart';
//import 'api_example2.dart';
//import 'api_example1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SharedPreferencesExample(),
    );
  }
}
