import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';
import 'pantalla_detalle_cancha.dart';
import 'datos_canchas.dart';
import 'tarjeta_cancha.dart';

class PantallaExplorarCanchas extends StatefulWidget {
  const PantallaExplorarCanchas({super.key});

  @override
  State<PantallaExplorarCanchas> createState() =>
      _PantallaExplorarCanchasState();
}

class _PantallaExplorarCanchasState extends State<PantallaExplorarCanchas> {
  String busqueda = '';

  void abrirDetalleCancha(int indice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PantallaDetalleCancha(
          cancha: DatosCanchas.canchas.where((cancha) {
            final texto = busqueda.toLowerCase().trim();

            return cancha.nombre.toLowerCase().contains(texto) ||
                cancha.direccion.toLowerCase().contains(texto);
          }).toList()[indice],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canchas = DatosCanchas.canchas.where((cancha) {
      final texto = busqueda.toLowerCase().trim();

      return cancha.nombre.toLowerCase().contains(texto) ||
          cancha.direccion.toLowerCase().contains(texto);
    }).toList();

    return Scaffold(
      backgroundColor: ColoresAplicacion.darkBackground,
      appBar: AppBar(
        backgroundColor: ColoresAplicacion.darkBackground,
        foregroundColor: Colors.white,
        title: const Text(
          'Explorar canchas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENCUENTRA TU CANCHA',
                    style: TextStyle(
                      color: ColoresAplicacion.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '¿Dónde jugamos hoy?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Explora las canchas y encuentra tu lugar ideal.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (valor) {
                  setState(() => busqueda = valor);
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Buscar cancha o ubicación',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColoresAplicacion.primary,
                  ),
                  filled: true,
                  fillColor: ColoresAplicacion.darkSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(
                      color: ColoresAplicacion.darkBorder,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${canchas.length} canchas encontradas',
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: canchas.isEmpty
                  ? const Center(
                      child: Text(
                        'No encontramos canchas con esa búsqueda.',
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : LayoutBuilder(
                      builder: (context, restricciones) {
                        final anchoTarjeta = (restricciones.maxWidth - 32)
                            .clamp(0.0, 440.0)
                            .toDouble();

                        final altoTarjeta = (anchoTarjeta * 9 / 16) + 175;

                        return ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                          itemCount: canchas.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            return Center(
                              child: SizedBox(
                                width: anchoTarjeta,
                                height: altoTarjeta,
                                child: TarjetaCancha(
                                  cancha: canchas[index],
                                  alPulsar: () => abrirDetalleCancha(index),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
