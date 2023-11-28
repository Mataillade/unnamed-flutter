import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: Colors.divider,
            width: 1.0
          )
        )
      ),
      child: const FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.1,
        child: Text("hllo"),
      ),
    );
  }

}