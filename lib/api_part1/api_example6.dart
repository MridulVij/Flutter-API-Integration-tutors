// login & Register page using the api's

// register
// we got id and token in response

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

void login(String email, password) async {
  try {
    final response = await http.post(Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print('Login Succeeded');
      print(data['token']);
      print(data);
    } else {
      print('Login Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}

void register(String email, password) async {
  try {
    final response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print('Register Succeeded');
      print(data['token']);
      print(data['id']);
      print(data);
    } else {
      print('Register Failed');
    }
  } catch (e) {
    print(e.toString());
  }
}

// login ui
class LoginApi extends StatelessWidget {
  LoginApi({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(controller: email),
        TextFormField(controller: pass),
        MaterialButton(
            onPressed: () {
              login(email.text.toString(), pass.text.toString());
            },
            child: Text('Login'))
      ]),
    );
  }
}

// register ui
class RegisterApi extends StatelessWidget {
  RegisterApi({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(controller: email),
        TextFormField(controller: pass),
        MaterialButton(
            onPressed: () {
              register(email.text.toString(), pass.text.toString());
            },
            child: Text('Register'))
      ]),
    );
  }
}

class Directions extends StatelessWidget {
  const Directions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MaterialButton(
          onPressed: () {
            Get.to(LoginApi());
          },
          child: Text('Login Interface'),
        ),
        MaterialButton(
          onPressed: () {
            Get.to(RegisterApi());
          },
          child: Text('Register Interface'),
        )
      ]),
    );
  }
}
