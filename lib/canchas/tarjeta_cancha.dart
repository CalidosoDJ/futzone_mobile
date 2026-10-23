import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';
import 'cancha.dart';

class TarjetaCancha extends StatelessWidget {
  final Cancha cancha;
  final VoidCallback? alPulsar;

  const TarjetaCancha({super.key, required this.cancha, this.alPulsar});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: alPulsar,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: ColoresAplicacion.darkSurface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: ColoresAplicacion.darkBorder),
        ),

        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                cancha.imagen,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('ERROR CARGANDO IMAGEN: ${cancha.imagen}');
                  debugPrint('DETALLE: $error');

                  return const Center(
                    child: Icon(
                      Icons.sports_soccer,
                      color: ColoresAplicacion.primary,
                      size: 48,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cancha.nombre,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: ColoresAplicacion.primary,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          cancha.direccion,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: ColoresAplicacion.rating,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        cancha.calificacion.toStringAsFixed(1),
                        style: const TextStyle(color: Colors.white),
                      ),

                      const Spacer(),

                      Text(
                        '\$${cancha.precio.toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (coincidencia) => '.')}',
                        style: const TextStyle(
                          color: ColoresAplicacion.primary,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        onPressed: alPulsar,
                        tooltip: 'Ver cancha',
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: ColoresAplicacion.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
