import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        titleTextStyle:const TextStyle(color: Colors.black) ,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:const  Row(
          children: [
            Text("My Text"),
          ],
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          )
        ),
      ),
    );
  }

}