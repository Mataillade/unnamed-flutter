// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../util/exentions/colors.extentions.dart';

class FavoriButton extends StatefulWidget {
  const FavoriButton({super.key});

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
        color: isFavorited ? CustomColors.warining : null,
      ),
      onPressed: () {
        setState(() {
          isFavorited = !isFavorited;
        });
      },
    );
  }
}
