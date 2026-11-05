import 'package:flutter/material.dart';

import '../autenticacion/pantalla_inicio_sesion.dart';
import '../tema/colores_aplicacion.dart';
import 'cancha.dart';

class PantallaDetalleCancha extends StatelessWidget {
  final Cancha cancha;

  const PantallaDetalleCancha({super.key, required this.cancha});

  @override
  Widget build(BuildContext context) {
    final precio = cancha.precio.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => '.',
    );

    return Scaffold(
      backgroundColor: ColoresAplicacion.darkBackground,
      appBar: AppBar(
        backgroundColor: ColoresAplicacion.darkBackground,
        foregroundColor: Colors.white,
        title: const Text('Detalle de la cancha'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  cancha.imagen,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const Center(
                    child: Icon(
                      Icons.sports_soccer,
                      color: ColoresAplicacion.primary,
                      size: 60,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CANCHA DISPONIBLE PARA EXPLORAR',
                      style: TextStyle(
                        color: ColoresAplicacion.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      cancha.nombre,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: ColoresAplicacion.rating,
                          size: 22,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          cancha.calificacion.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: ColoresAplicacion.darkSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ColoresAplicacion.darkBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ubicación',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: ColoresAplicacion.primary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  cancha.direccion,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: ColoresAplicacion.darkSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: ColoresAplicacion.darkBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Precio de referencia',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            '\$$precio',
                            style: const TextStyle(
                              color: ColoresAplicacion.primary,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      '¿Listo para tu próximo partido?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Selecciona la fecha y el horario para preparar '
                      'tu reserva de cancha.',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
          child: SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (contexto) => AlertDialog(
                    title: const Text('Inicia sesión'),
                    content: const Text(
                      'Para realizar una reserva debes iniciar sesión '
                      'en FutZone.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(contexto),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(contexto);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PantallaInicioSesion(),
                            ),
                          );
                        },
                        child: const Text('Iniciar sesión'),
                      ),
                    ],
                  ),
                );
              },

              icon: const Icon(Icons.calendar_month_outlined),
              label: const Text(
                'Reservar cancha',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColoresAplicacion.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
