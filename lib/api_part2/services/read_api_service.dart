import 'dart:convert';

import '../models/read_model2.dart';

import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchusers() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
          cell: e['cell'], email: e['email'], gender: e['gender'], name: name);
    }).toList();
    return users;
  }
}
