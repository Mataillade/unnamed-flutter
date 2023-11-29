// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:unnamed/util/exentions/colors.extentions.dart';
import 'package:unnamed/util/function/functions.dart';
import '../../Model/users.model.dart';
import '../../screens/home/Chat/room/room.dart';

class ContactMessageWidget extends StatelessWidget {
  final Users user;
  const ContactMessageWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Action à effectuer lorsqu'on appuie sur le Container
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Room(user: user)),
        );
      },
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: generateColor(getInitials(user.username))
            ),
            child: Text(getInitials(user.username), textScaleFactor: 2, style: const TextStyle(color: Colors.white),),
          ) ,
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            width: MediaQuery.of(context).size.width* 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.username, textScaleFactor: 1.2, style: TextStyle(fontWeight:FontWeight.bold )),
                SizedBox(height: 5),
                Text("hazndkjanjdzadbhkazbdhkbajhdbazjhdbvajhldvhjlazvdjhvajldvey",
                  style: TextStyle(color: CustomColors.secondary_text, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: const Text(
              "17/01",
              style: TextStyle(color: CustomColors.secondary_text),
            ),
          ),
        ],
      )
    );
  }

}
