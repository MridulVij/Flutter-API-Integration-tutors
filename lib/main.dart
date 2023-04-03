import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/post_model.dart';
import 'api_ex1.dart';
import 'api_example5.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiEx1(),
    );
  }
}
