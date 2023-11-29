// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:unnamed/util/exentions/colors.extentions.dart';
import 'package:unnamed/widgets/Contact/contact_message.widget.dart';

class Chat extends StatelessWidget {
  //make the request to get all users on the database firestore


  final List<String> persons = <String>["A", "B", "C"];


   Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Chat", style: TextStyle(color: CustomColors.blackk)),
        centerTitle: false,
        titleSpacing: 24,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          itemCount: persons.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,),
          itemBuilder: (BuildContext context, int index) {
          return Container(
            margin:const EdgeInsets.symmetric(vertical: 10),
            //child:  ContactMessageWidget(user: persons[index])
          );
        }
      )
    );
  }

}
