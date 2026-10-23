import 'package:flutter/material.dart';

import '../tema/tema_aplicacion.dart';
import '../inicio/pantalla_inicio.dart';

class FutZoneApp extends StatelessWidget {
  const FutZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutZone',
      debugShowCheckedModeBanner: false,
      theme: TemaAplicacion.temaClaro,
      home: const PantallaInicio(),
    );
  }
}