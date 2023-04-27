import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/read_model2.dart';

class Read1 extends StatefulWidget {
  const Read1({super.key});

  @override
  State<Read1> createState() => _Read1State();
}

class _Read1State extends State<Read1> {
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.),
                //tileColor: genderColor,
                // title: Column(
                //   children: [Text(cellphno), Text(email), Text(gender)],
                // ));

                );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchusers),
    );
  }

  void fetchusers() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
          first: e['name']['first'],
          last: e['name']['last'],
          title: e['name']['title']);
      return User(cell: e['cell'], email: e['email'], gender: e['gender'], name: name);
    }).toList();
    setState(() {
      users = transformed;
    });
    if (kDebugMode) {
      print("fetchUsers Completed");
    }
  }
}
