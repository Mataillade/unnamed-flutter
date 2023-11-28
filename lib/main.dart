import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unnamed/screens/login/login.dart';

import 'package:unnamed/screens/onboard/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const OnBoard(),
      routes:   {
        '/login': (BuildContext context) => const Login(),
      },
    );
  }
}

