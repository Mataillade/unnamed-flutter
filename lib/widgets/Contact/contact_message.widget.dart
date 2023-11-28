import 'package:flutter/material.dart';

import '../../screens/home/Chat/room/room.dart';

class ContactMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Action à effectuer lorsqu'on appuie sur le Container
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Room()),
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
                color: Colors.blue
            ),
            child: const Text("RD", textScaleFactor: 2, style: TextStyle(color: Colors.white),),
          ) ,
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            width: MediaQuery.of(context).size.width* 0.6,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Couocu", textScaleFactor: 1.2, style: TextStyle(fontWeight:FontWeight.bold )),
                SizedBox(height: 5),
                Text("hazndkjanjdzadbhkazbdhkbajhdbazjhdbvajhldvhjlazvdjhvajldvey",
                  style: TextStyle(color: Colors.secondary_text, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.center,
            child: Text(
              "17/01",
              style: TextStyle(color: Colors.secondary_text),
            ),
          ),
        ],
      )
    );
  }

}