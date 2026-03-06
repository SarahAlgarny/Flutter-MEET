// import 'package:flutter/material.dart';
// import 'signup.dart';
// import 'login.dart';
// import 'HomePage.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SignUpPage(),
//       routes: {
//         '/login': (context) => const LoginPage(),
//         '/signup': (context) => const SignUpPage(),
//         //'/home': (context) => const HomePage(),
//       },
//     );
//   }
// }import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}
