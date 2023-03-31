/// In this we will working on Text,  json object and we able to fetch text from api
/// this example shows how to fetc text from api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Http API Calling
  List<PostsModel> postList = [];
  //
  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api Tutorial'),
        ),
        body: Column(
          children: [
            // Showing our API
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                //initialData: InitialData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  Text(
                                    postList[index].title.toString(),
                                  ),
                                  Text('Description',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  Text(postList[index].title.toString())
                                ]),
                          );
                          //Text(postList[index].title.toString());
                          //Text(index.toString());
                        });
                  }
                },
              ),
            ),
          ],
        ));
  }
}
