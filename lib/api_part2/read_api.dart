import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user["email"];
            return ListTile(
              title: Text(email),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchusers),
    );
  }

  void fetchusers() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["results"];
    });
    print("fetchUsers Completed");
  }
}
