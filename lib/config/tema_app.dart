import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colores_app.dart';

ThemeData obtenerTemaApp() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColoresApp.fondoPantalla,

    // Tipografía Global para toda la App
    textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
      displayLarge: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.w800,
        color: ColoresApp.textoTitulo,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        color: ColoresApp.textoTitulo,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(color: ColoresApp.textoContenido),
      bodyMedium: GoogleFonts.plusJakartaSans(
        color: ColoresApp.textoDesactivado,
      ),
    ),
  );
}
