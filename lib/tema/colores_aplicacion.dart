import 'package:flutter/material.dart';

abstract final class ColoresAplicacion {
  // Colores principales FutZone
  static const Color primary = Color(0xFF16A34A);
  static const Color primaryDark = Color(0xFF15803D);
  static const Color primaryDeep = Color(0xFF166534);
  static const Color primaryLight = Color(0xFFDCFCE7);
  static const Color primaryBorder = Color(0xFFBBF7D0);

  // Fondos y superficies
  static const Color background = Color(0xFFF3F4F6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSecondary = Color(0xFFF9FAFB);

  // Textos
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textBody = Color(0xFF374151);
  static const Color textMuted = Color(0xFF6B7280);

  // Bordes
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderStrong = Color(0xFFD1D5DB);

  // Estados
  static const Color error = Color(0xFFEF4444);
  static const Color rating = Color(0xFFFACC15);
  static const Color info = Color(0xFF3B82F6);
  static const Color warning = Color(0xFFF97316);
  static const Color cyan = Color(0xFF06B6D4);

  // Superposición
  static const Color overlay = Color(0x99000000);

  // Fondos oscuros del dashboard móvil
  static const Color darkBackground = Color(0xFF00111D);
  static const Color darkSurface = Color(0xFF031C29);
  static const Color darkBorder = Color(0xFF07505A);
}