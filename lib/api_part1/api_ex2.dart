// How to call api in flutter | Flutter Tutorial in hindi | Calling apps in flutter
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiEx2 extends StatefulWidget {
  const ApiEx2({super.key});

  @override
  State<ApiEx2> createState() => _ApiEx2State();
}

class _ApiEx2State extends State<ApiEx2> {
  final url = "https://older.typicode.cjsonplacehom/photos";
  @override
  void initState() {
    super.initState();
    //
    getdata();
  }

  getdata() async {
    var res =
        await http.get(Uri.http("jsonplaceholder.typicode.com", "photos"));
    print(res.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          //

          ),
    );
  }
}
