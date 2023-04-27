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
            final name = user["name"]["title"];
            final email = user["email"];
            final image = user["picture"]["large"];
            return Card(
              shadowColor: Colors.black,
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(image)),
                    Text(name),
                    Text(email)
                  ],
                ),
              ),
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
    setState(() {
      users = json["results"];
    });
    print("fetchUsers Completed");
  }
}
