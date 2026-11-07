import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colores_aplicacion.dart';

abstract final class TemaAplicacion {
  static ThemeData get temaClaro {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      scaffoldBackgroundColor: ColoresAplicacion.background,

      colorScheme: ColorScheme.fromSeed(
        seedColor: ColoresAplicacion.primary,
        primary: ColoresAplicacion.primary,
        surface: ColoresAplicacion.surface,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: ColoresAplicacion.surface,
        foregroundColor: ColoresAplicacion.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColoresAplicacion.surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColoresAplicacion.primary,
            width: 2,
          ),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColoresAplicacion.primary,
          foregroundColor: ColoresAplicacion.surface,
          minimumSize: const Size(0, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
