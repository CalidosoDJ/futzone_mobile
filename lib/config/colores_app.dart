import 'package:flutter/material.dart';

abstract class ColoresApp {
  // Colores Marca / Principal (Verdes)
  static const Color verdeBoton = Color(0xFF16A34A); // bg-green-600[cite: 1]
  static const Color verdeOscuro = Color(0xFF15803D); // bg-green-700[cite: 1]
  static const Color verdeProfundo = Color(
    0xFF166534,
  ); // text-green-900[cite: 1]
  static const Color verdeFondoSuave = Color(
    0xFFDCFCE7,
  ); // bg-green-100[cite: 1]
  static const Color verdeBorde = Color(
    0xFFBBF7D0,
  ); // border-green-200[cite: 1]

  // Escala de Grises y Superficies (Neutros)
  static const Color fondoPantalla = Color(0xFFF3F4F6); // bg-gray-100[cite: 2]
  static const Color fondoTarjeta = Color(0xFFFFFFFF); // bg-white[cite: 2]
  static const Color fondoSecundario = Color(0xFFF9FAFB); // bg-gray-50[cite: 2]
  static const Color textoTitulo = Color(0xFF1F2937); // text-gray-800[cite: 2]
  static const Color textoContenido = Color(
    0xFF374151,
  ); // text-gray-700[cite: 2]
  static const Color textoDesactivado = Color(
    0xFF6B7280,
  ); // text-gray-500[cite: 2]
  static const Color bordeDivisor = Color(
    0xFFE5E7EB,
  ); // border-gray-200[cite: 2]

  // Colores de Estado e Íconos
  static const Color estadoAlerta = Color(0xFFEF4444); // Red-500[cite: 3]
  static const Color estadoEstrella = Color(0xFFFACC15); // Yellow-400[cite: 3]
  static const Color estadoInfo = Color(0xFF3B82F6); // Blue-500[cite: 3]
  static const Color estadoAdvertencia = Color(
    0xFFF97316,
  ); // Orange-500[cite: 3]
  static const Color estadoCamerino = Color(0xFF06B6D4); // Cyan-500[cite: 3]
  static const Color sombraModal = Color(0x99000000); // bg-black/60[cite: 3]
}
