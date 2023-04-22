// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'Model/user_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<UserModel> userList = [];
//   var data;
//   Future<void> getUserApi() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//     if (response.statusCode == 200) {
//       data = jsonDecode(response.body.toString());
//     } else {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Api Example 4')),
//         body: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder(
//                 future: getUserApi(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Text('Loading');
//                   } else {
//                     return ListView.builder(
//                         itemCount: data.length,
//                         itemBuilder: (context, index) {
//                           return Card(
//                               child: Column(
//                             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               //
//                               Reusable(
//                                   title: 'name',
//                                   value: data[index]['name'].toString()),
//                               Reusable(
//                                   title: 'Username',
//                                   value: data[index]['username'].toString()),
//                               Reusable(
//                                   title: 'address',
//                                   value: data[index]['address']['street']
//                                       .toString()),
//                               Reusable(
//                                   title: 'Geo',
//                                   value: data[index]['address']['geo']['lat']
//                                       .toString()),
//                             ],
//                           ));
//                         });
//                   }
//                 },
//               ),
//             )
//           ],
//         ));
//   }
// }

// class Reusable extends StatelessWidget {
//   Reusable({super.key, required this.title, required this.value});

//   final title;
//   final value;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(4.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(title),
//             Text(value),
//           ],
//         ));
//   }
// }
