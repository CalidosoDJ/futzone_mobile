import 'package:flutter/material.dart';

import '../tema/tema_aplicacion.dart';
import '../inicio/pantalla_inicio.dart';
import '../modules/jugador/inicio/dashboard.dart';

class FutZoneApp extends StatelessWidget {
  const FutZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutZone',
      debugShowCheckedModeBanner: false,
      theme: TemaAplicacion.temaClaro,
      home: const PantallaInicio(),
      routes: {
        '/dashboard-jugador': (context) => const PantallaInicioJugador(),
      },
    );
  }
}
