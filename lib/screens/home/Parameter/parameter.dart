import 'package:flutter/material.dart';

class Parameter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Parameter", style: TextStyle(color: Colors.black),),
        centerTitle: false,
        titleSpacing: 24,
      ),
    );
  }

}