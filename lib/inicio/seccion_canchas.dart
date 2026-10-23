import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';
import '../canchas/datos_canchas.dart';
import '../canchas/tarjeta_cancha.dart';

class SeccionCanchas extends StatelessWidget {
  const SeccionCanchas({super.key});

  @override
  Widget build(BuildContext context) {
    final canchas = DatosCanchas.canchas;
    final anchoPantalla = MediaQuery.sizeOf(context).width;

    final anchoTarjeta = anchoPantalla < 600 ? anchoPantalla * 0.78 : 320.0;

    // La imagen mantiene una proporción de 16:9.
    // Reservamos espacio suficiente para los datos de la cancha.
    final altoTarjeta = (anchoTarjeta * 9 / 16) + 175;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NUESTRAS CANCHAS',
                  style: TextStyle(
                    color: ColoresAplicacion.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Encuentra tu cancha ideal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Explora nuestras canchas disponibles.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: altoTarjeta,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: canchas.length,
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: anchoTarjeta,
                  child: TarjetaCancha(
                    cancha: canchas[index],
                    alPulsar: () {
                      showDialog<void>(
                        context: context,
                        builder: (contexto) => AlertDialog(
                          title: const Text('Inicia sesión'),
                          content: const Text(
                            'Para consultar los detalles de esta cancha, '
                            'primero debes iniciar sesión o registrarte '
                            'en FutZone.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(contexto),
                              child: const Text('Entendido'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
