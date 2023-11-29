import 'package:flutter/material.dart';
import 'package:unnamed/widgets/Contact/contact.widget.dart';

import '../../../util/exentions/colors.extentions.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B','C', 'D', 'E', 'F'];

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Contact", style: TextStyle(color: CustomColors.blackk),),
        centerTitle: false,
        titleSpacing: 24,
      ),
      body:ListView.separated(
        itemCount: entries.length,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        itemBuilder: (BuildContext context, int index){
          return  Container(
              margin: const EdgeInsets.symmetric(vertical: 10) ,
              child: const ContactWidget()
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ) ,
    );
  }

}