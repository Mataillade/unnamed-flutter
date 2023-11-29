// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../util/exentions/colors.extentions.dart';

class ButtonWidget extends StatelessWidget {

  final VoidCallback onPressed;
  final String text;

  const ButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: CustomColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text(text)
    );
  }

}
