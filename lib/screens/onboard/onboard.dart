// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:unnamed/widgets/buttons/button.widget.dart';
import '../login/login.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/start.svg",
                width: 300.0, // Largeur souhaitée
                height: 300.0
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: ButtonWidget(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
              }, text: "Start Messaging"),
            )

          ],
        ),
      ),
    );
  }
}
