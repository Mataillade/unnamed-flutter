// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

Color generateColor(String input) {
  int hash = 0;

  for (int i = 0; i < input.length; i++) {
    hash = input.codeUnitAt(i) + ((hash << 5) - hash);
  }

  final random = Random(hash);
  return Color.fromARGB(
    255,
    random.nextInt(255),
    random.nextInt(255),
    random.nextInt(255),
  );
}

String getInitials(String fullName) {
  List<String> nameParts = fullName.split(" ");
  String initials = "";

  if (nameParts.isNotEmpty) {
    initials += nameParts[0][0].toUpperCase();

    if (nameParts.length > 1) {
      initials += nameParts[nameParts.length - 1][0].toUpperCase();
    }
  }

  return initials;
}
