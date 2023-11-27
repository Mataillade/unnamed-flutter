import 'package:flutter/material.dart';
import 'package:unnamed/screens/login/login.dart';

import 'package:unnamed/screens/onboard/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: OnBoard(),
      routes:   {
        '/login': (BuildContext context) => const Login(),
      },
    );
  }
}

