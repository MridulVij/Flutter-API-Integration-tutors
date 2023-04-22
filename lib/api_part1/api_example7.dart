// // shared preferences for login and register
// import 'package:api_tutorial/api_example6.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesEx extends StatefulWidget {
//   SharedPreferencesEx({super.key});

//   @override
//   State<SharedPreferencesEx> createState() => _SharedPreferencesExState();
// }

// class _SharedPreferencesExState extends State<SharedPreferencesEx> {
//   //final String name;
//   @override
//   Widget build(BuildContext context) {
//     String name = '';
//     late int age = 0;

//     @override
//     void initState() async {
//       super.initState();
//       SharedPreferences sp = await SharedPreferences.getInstance();
//       name = sp.getString('name') ?? '';
//       age = sp.getInt('age') ?? 0;
//       setState(() {});
//     }

//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Text(name.toString()),
//             Text(age.toString()),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           SharedPreferences sp = await SharedPreferences.getInstance();
//           sp.remove('name');
//           sp.remove('age');
//           sp.setInt('age', 21);
//           sp.setString('name', 'Mridul Vij');
//           // sp.setBool('login', false);
//           // name = sp.getString('name') ?? '';
//           setState(() {});
//         },
//         child: Text('+'),
//       ),
//     );
//   }
// }

// Shared preferences
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  const SharedPreferencesExample({super.key});

  @override
  State<SharedPreferencesExample> createState() =>
      _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  static String? finalEmail;

  @override
  void initState() {
    getValidation().whenComplete(() async {
      Timer(const Duration(seconds: 2),
          () => Get.to(finalEmail == null ? LoginPage() : Home()));
    });
    super.initState();
  }

  Future getValidation() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var obtainedEmail = sp.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text('Splash Screen')],
    ));
  }
}

// login
class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextFormField(controller: emailController),
          TextFormField(controller: passController),
          MaterialButton(
            child: Text('login'),
            onPressed: () async {
              final SharedPreferences sp =
                  await SharedPreferences.getInstance();
              sp.setString('email', emailController.text);
              Get.to(Home());
            },
          ),
        ],
      ),
    ));
  }
}

// home
class Home extends StatelessWidget {
  const Home({super.key});

  //get finalEmail => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Welcome'),
        ElevatedButton(
            onPressed: () async {
              //
              final SharedPreferences sp =
                  await SharedPreferences.getInstance();
              sp.remove('email');
              Get.to(LoginPage());
            },
            child: Text('Logout'))
      ],
    ));
  }
}
