// Read == get

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/read_model.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  // api integration
  Future<List<ReadModel>> getEmployees() async {
    final response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
    if (response.statusCode == 200) {
      final finalResponse = jsonDecode(response.body);

      // only works on debug mod
      if (kDebugMode) {
        print(response);
        print("/n");
        print(finalResponse);
      }

      // kuch return krna tha toh mene ye kga diya
      return jsonDecode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
