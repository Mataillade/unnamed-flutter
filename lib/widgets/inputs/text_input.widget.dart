import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  final String hint;

  const TextInput({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.background
      ),
      child: TextField (
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none
        ),
      ),
    );
  }

}