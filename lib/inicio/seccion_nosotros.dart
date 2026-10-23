import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';

class SeccionNosotros extends StatelessWidget {
  const SeccionNosotros({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      color: ColoresAplicacion.darkSurface,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SOBRE NOSOTROS',
            style: TextStyle(
              color: ColoresAplicacion.primary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          SizedBox(height: 12),

          Text(
            'Tu pasión por el fútbol merece un lugar donde jugar.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.25,
            ),
          ),

          SizedBox(height: 14),

          Text(
            'En FutZone conectamos a los apasionados del fútbol '
            'con las mejores canchas para disfrutar cada partido. '
            'Encuentra y reserva tu espacio de manera rápida y sencilla.',
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
          ),

          SizedBox(height: 18),

          Text(
            'Menos tiempo buscando, más tiempo jugando.',
            style: TextStyle(
              color: ColoresAplicacion.primary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
