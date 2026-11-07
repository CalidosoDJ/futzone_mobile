import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';

class PantallaMisReservas extends StatelessWidget {
  const PantallaMisReservas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresAplicacion.background,
      appBar: AppBar(title: const Text('Mis reservas')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: 72,
                color: ColoresAplicacion.primary,
              ),
              const SizedBox(height: 20),
              const Text(
                'Mis reservas',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColoresAplicacion.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Aquí podrás consultar tus próximas reservas '
                'y el historial de canchas reservadas.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: ColoresAplicacion.textMuted,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Las reservas estarán disponibles cuando '
                'conectemos el servicio correspondiente.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: ColoresAplicacion.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
