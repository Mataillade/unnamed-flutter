import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unnamed/widgets/Contact/contact_message.widget.dart';

class Chat extends StatelessWidget {
  final List<String> entries = <String>['A', 'B','C', 'D', 'E', 'F'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Chat", style: TextStyle(color: Colors.black)),
        centerTitle: false,
        titleSpacing: 24,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          itemCount: entries.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,),
          itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:const EdgeInsets.symmetric(vertical: 10),
            child: ContactMessageWidget()
          );
        }
      )
    );
  }

}