// Flutter imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Brightness, SystemChrome, SystemUiOverlayStyle;

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:unnamed/screens/home/home.dart';
import 'package:unnamed/widgets/buttons/button.widget.dart';
import 'package:unnamed/widgets/inputs/text_input.widget.dart';
import '../../util/exentions/colors.extentions.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        titleTextStyle:const TextStyle(color: CustomColors.blackk) ,
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
              PhysicalModel(
                color: CustomColors.secondary_background,
                elevation: 3,
                shape: BoxShape.circle,
                child: Container(
                  width: 100,
                  height: 100,
                  child: const Icon(
                    Icons.person_outlined,
                    size: 50.0,
                  ),
                ),
              ),

              const SizedBox(height: 50),
              FractionallySizedBox(
                widthFactor: 0.5,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) {
                          if (user != null) {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
                          }
                        });
                        await signInWithGoogle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomColors.primary,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                              ),
                              child: SvgPicture.asset("assets/Google.svg"),
                            ),

                            Text("Sign Up", style: TextStyle(color: Colors.white ,fontSize: 24, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    )
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
