// // Read == get

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Read extends StatefulWidget {
//   const Read({super.key});

//   @override
//   State<Read> createState() => _ReadState();
// }

// class _ReadState extends State<Read> {
//   // api integration
//   Future<List<dynamic>> getEmployees() async {
//     final response = await http
//         .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
//     if (response.statusCode == 200) {
//       final finalResponse = jsonDecode(response.body);
//       print(finalResponse);
//       return jsonDecode(response.body);
//     } else {
//       return json.decode(response.body);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: getEmployees(),
//         builder: (context, snapshot) {
//           final employees = snapshot.data;
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView.separated(
//               separatorBuilder: (context, index) {
//                 return Divider(
//                   height: 2,
//                   color: Colors.black,
//                 );
//               },
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(employees[index]['employee_name']),
//                   subtitle: Text('Age: ${employees[index]['employee_age']}'),
//                 );
//               },
//               itemCount: employees.length,
//             );
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
