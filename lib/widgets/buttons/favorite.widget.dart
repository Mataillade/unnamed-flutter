import 'package:flutter/material.dart';

class FavoriButton extends StatefulWidget {
  @override
  _FavoriButtonState createState() => _FavoriButtonState();
}

class _FavoriButtonState extends State<FavoriButton> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorited ? Icons.star : Icons.star_border,
        color: isFavorited ? Colors.yellow : null,
      ),
      onPressed: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
    );
  }
}