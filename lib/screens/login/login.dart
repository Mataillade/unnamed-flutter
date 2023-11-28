import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Brightness, SystemChrome, SystemUiOverlayStyle;
import 'package:unnamed/screens/home/home.dart';
import 'package:unnamed/widgets/buttons/button.widget.dart';
import 'package:unnamed/widgets/inputs/text_input.widget.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        titleTextStyle:const TextStyle(color: Colors.black) ,
        backgroundColor: Colors.white,
        elevation: 0,
        title:const Row(
          children: [
            Text("Login"),
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
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1 ),
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.secondary_background,
                ),
                child: const Icon(
                    Icons.person_outlined,
                    size: 50.0,
                ),
              ),
              const SizedBox(height: 30),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    const TextInput(hint: "Entrez le text ici",),
                    const SizedBox(height: 15),
                    const TextInput(hint: "Entrez le text ici",),
                    const SizedBox(height: 30),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: ButtonWidget(onPressed:() {
                        Navigator.push(context,  MaterialPageRoute(builder: (context)=> Home()));
                      }, text: 'Save',),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}