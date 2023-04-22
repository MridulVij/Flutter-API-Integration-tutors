// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'Model/photos_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Photos> photosList = [];
//   //String url = '';
//   String baseUrl = 'https://jsonplaceholder.typicode.com';
// //https://jsonplaceholder.typicode.com
//   Future<List<Photos>> getPhotos() async {
//     try {
//       final response = await http.get(Uri.parse(baseUrl + '/photos'));
//       var data = jsonDecode(response.body.toString());
//       print(data);
//       if (response.statusCode == 200) {
//         for (Map i in data) {
//           Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
//           photosList.add(photos);
//         }
//         return photosList;
//       } else {
//         return photosList;
//       }
//     } catch (e) {
//       Text('Please Check Your Internet Connection');
//     }
//     throw {'please check your internet connection'};
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Api tutorial example 2')),
//         body: Column(
//           children: [
//             Expanded(
//                 child: FutureBuilder(
//                     future: getPhotos(),
//                     builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
//                       return ListView.builder(
//                           itemCount: photosList.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               child: ListTile(
//                                   leading: CircleAvatar(
//                                     backgroundImage: NetworkImage(
//                                         snapshot.data![index].url.toString()),
//                                   ),
//                                   subtitle: Text(
//                                       snapshot.data![index].title.toString()),
//                                   title: Text('Notes Id:' +
//                                       snapshot.data![index].id.toString())),
//                             );
//                           });
//                     })),
//             //
//           ],
//         ));
//   }
// }
