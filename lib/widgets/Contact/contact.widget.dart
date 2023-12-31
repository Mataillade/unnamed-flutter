// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:unnamed/screens/home/Chat/room/room.dart';
import 'package:unnamed/util/function/functions.dart';
import 'package:unnamed/widgets/buttons/favorite.widget.dart';
import '../../Model/users.model.dart';
import '../../util/exentions/colors.extentions.dart';

class ContactWidget extends StatelessWidget {
  final Users user;
  const ContactWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: generateColor(getInitials(user.username))
          ),
          child: Text(getInitials(user.username), textScaleFactor: 2, style: TextStyle(color: Colors.white),),
        ) ,
        InkWell(
          onTap: () {
            // Action à effectuer lorsqu'on appuie sur le Container
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Room(user: user,)),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10.0),
            width: MediaQuery.of(context).size.width* 0.6,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.username, textScaleFactor: 1.2, style: TextStyle(fontWeight:FontWeight.bold )),
                SizedBox(height: 5),
                Text("last Connexion : Today", style: TextStyle(color: CustomColors.secondary_text, fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width* 0.1,

          child: const FavoriButton()
        )
      ],
    );
  }

}
