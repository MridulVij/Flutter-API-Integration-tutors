import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiEx1 extends StatefulWidget {
  const ApiEx1({super.key});

  @override
  State<ApiEx1> createState() => _ApiEx1State();
}

class _ApiEx1State extends State<ApiEx1> {
  // late keyword is used to declare variable which is used later or initialized later
  String? stringResponse;
  List? listResponse;
  Map? mapResponse;
  List? listOfFacts;

  Future fetchData() async {
    http.Response response;
    response = await http
        .get(Uri.parse('https://www.thegrowingdeveloper.org/apiview?id=2'));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body.toString());
        listOfFacts = mapResponse!['facts'];
      });
    }
  }

// init state runs first time before opening the app it means api will calls whenever we open app and we got response before opening the app
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //
            mapResponse == null
                ? Container(child: Text('error'))
                // text -> stringResponse.toString()
                : Column(
                    children: [
                      Text(mapResponse!['category'].toString(),
                          style: TextStyle(fontSize: 50)),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                              child: Column(
                            children: [
                              Text(
                                listOfFacts![index]['title'].toString(),
                              ),
                              Image.network(listOfFacts![index]['image_url']),
                              SizedBox(height: 20),
                            ],
                          ));
                        },
                        itemCount:
                            listOfFacts == null ? 0 : listOfFacts?.length,
                      )
                    ],
                  ),
            //
          ],
        ),
      )),
    );
  }
}
