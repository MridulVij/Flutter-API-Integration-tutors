// Create == post

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController age = TextEditingController();

// api Intergration
  Future<bool> addEmployee() async {
    Map<String, dynamic> body = {
      "name": name.text,
      "salary": salary.text,
      "age": age.text
    };

    // post == create == add to server, database
    final response = await http.post(
        Uri.parse('https://dummy.restapiexample.com/api/v1/create'),
        body: body);

    // response
    if (response.statusCode == 200) {
      final finalResponse = jsonDecode(response.body);
      if (kDebugMode) {
        print(finalResponse);
      }
      return true;
    } else {
      return false;
    }
  }

// Ui Integration
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(controller: name),
          TextFormField(controller: salary),
          TextFormField(controller: age),
          ElevatedButton(
              onPressed: () {
                addEmployee();
              },
              child: Text('Create')),
        ],
      ),
    ));
  }
}
