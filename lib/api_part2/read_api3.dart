// using the same read_model2.dart no need to make another one

import 'package:api_tutorial/api_part2/services/read_api_service.dart';
import 'package:flutter/material.dart';
import 'models/read_model2.dart';

class Read2 extends StatefulWidget {
  const Read2({super.key});

  @override
  State<Read2> createState() => _Read2State();
}

class _Read2State extends State<Read2> {
  List<User> users = [];

  // autmatically fetching the data from api while button of READ is called
  @override
  void initState() {
    super.initState();
    fetchusers();
  }

// fetch the data
  Future<void> fetchusers() async {
    final response = await UserApi.fetchusers();
    setState(() {
      users = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.email),
            );
          }),
    );
  }
}
