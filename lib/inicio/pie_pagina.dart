import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';

class PiePagina extends StatelessWidget {
  const PiePagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: ColoresAplicacion.darkBackground,
        border: Border(top: BorderSide(color: ColoresAplicacion.darkBorder)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Fut',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: 'Zone',
                  style: TextStyle(color: ColoresAplicacion.primary),
                ),
              ],
            ),
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Tu cancha, tu equipo, tu momento.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),

          const SizedBox(height: 16),

          Text(
            '© ${DateTime.now().year} FutZone. '
            'Todos los derechos reservados.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white54, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
