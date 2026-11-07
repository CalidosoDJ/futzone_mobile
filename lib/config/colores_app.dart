import 'package:flutter/material.dart';
import '../tema/colores_aplicacion.dart';

abstract final class ColoresApp {
  static const Color verdeBoton = ColoresAplicacion.primary;
  static const Color verdeOscuro = ColoresAplicacion.primaryDark;
  static const Color verdeProfundo = ColoresAplicacion.primaryDeep;
  static const Color verdeFondoSuave = ColoresAplicacion.primaryLight;
  static const Color verdeBorde = ColoresAplicacion.primaryBorder;

  static const Color fondoPantalla = ColoresAplicacion.background;
  static const Color fondoTarjeta = ColoresAplicacion.surface;
  static const Color fondoSecundario = ColoresAplicacion.surfaceSecondary;

  static const Color textoTitulo = ColoresAplicacion.textPrimary;
  static const Color textoContenido = ColoresAplicacion.textBody;
  static const Color textoDesactivado = ColoresAplicacion.textMuted;
  static const Color bordeDivisor = ColoresAplicacion.border;

  static const Color estadoAlerta = ColoresAplicacion.error;
  static const Color estadoEstrella = ColoresAplicacion.rating;
  static const Color estadoInfo = ColoresAplicacion.info;
  static const Color estadoAdvertencia = ColoresAplicacion.warning;
  static const Color estadoCamerino = ColoresAplicacion.cyan;
  static const Color sombraModal = ColoresAplicacion.overlay;
}