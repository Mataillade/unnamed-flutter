// Flutter imports:
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get themeData {
    return ThemeData(
      primaryColor: const Color(0xFF002DE3), // Couleur principale de l'application
      hintColor: const Color(0xFF879FFF), // Couleur d'accentuation (secondary)
      scaffoldBackgroundColor: const Color(0xFFD2D5F9), // Couleur de fond par défaut (background)
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFFFFFFFF), // Couleur du bouton de texte (text_button)
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0F1828), toolbarTextStyle: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFFFFFFFF), // Couleur du texte de la barre d'applications (title)
            fontSize: 18.0,
          ),
        ).bodyMedium, titleTextStyle: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFFFFFFFF), // Couleur du texte de la barre d'applications (title)
            fontSize: 18.0,
          ),
        ).titleLarge,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F1828)), // Exemple de style de texte (title)
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF1B2B48)), // Exemple de style de texte (primary_text)
        bodyMedium: TextStyle(fontSize: 16, color: Color(0xFFA4A4A4)), // Exemple de style de texte (secondary_text)
      ),
      disabledColor: const Color(0xFFADB5BD), // Couleur des éléments désactivés (disabled)
      dividerColor: const Color(0xFFEDEDED), // Couleur des séparateurs (divider)
    );
  }
}
