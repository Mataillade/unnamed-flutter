import 'package:flutter/material.dart';
import 'package:unnamed/util/exentions/colors.extentions.dart';

class Parameter extends StatelessWidget {
  const Parameter({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Parameter", style: TextStyle(color: CustomColors.blackk),),
        centerTitle: false,
        titleSpacing: 24,
      ),
    );
  }

}