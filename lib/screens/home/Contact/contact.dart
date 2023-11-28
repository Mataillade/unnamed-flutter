import 'package:flutter/material.dart';
import 'package:unnamed/widgets/Contact/contact.widget.dart';

class Contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Contact", style: TextStyle(color: Colors.black),),
        centerTitle: false,
        titleSpacing: 24,
      ),
      body:  Container(
        child: ContactWidget(),
      ),
    );
  }

}