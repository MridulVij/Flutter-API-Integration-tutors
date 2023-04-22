import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'api_part1/Model/post_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Create == post')),
          ElevatedButton(onPressed: () {}, child: Text('Read == get')),
          ElevatedButton(onPressed: () {}, child: Text('Update == put')),
          ElevatedButton(onPressed: () {}, child: Text('Delete == delete')),
        ],
      )),
    );
  }
}
