import 'package:flutter/material.dart';
import 'config/tema_app.dart';
import 'modules/jugador/inicio/dashboard.dart';

void main() {
  runApp(const FutZoneApp());
}

class FutZoneApp extends StatelessWidget {
  const FutZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutZone',
      debugShowCheckedModeBanner: false,
      theme: obtenerTemaApp(), // Aplica Plus Jakarta Sans en toda la app
      home: const PantallaInicioJugador(),
    );
  }
}
