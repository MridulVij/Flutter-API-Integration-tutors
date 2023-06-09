import 'dart:convert';
import 'package:api_tutorial/api_part2/create_api.dart';
import 'package:api_tutorial/api_part2/read_api1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'api_part1/Model/post_model.dart';
import 'api_part2/read_api2.dart';
import 'api_part2/read_api3.dart';
import 'api_part2/services/read_api_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Get.to(Create()), child: Text('Create == post')),
          ElevatedButton(
              onPressed: () => Get.to(Read2()), child: Text('Read == get')),
          ElevatedButton(onPressed: () => null, child: Text('Update == put')),
          ElevatedButton(onPressed: () {}, child: Text('Delete == delete')),
        ],
      )),
    );
  }
}
