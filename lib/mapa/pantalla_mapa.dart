import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tema/colores_aplicacion.dart';
import '../canchas/datos_canchas.dart';
import '../canchas/pantalla_detalle_cancha.dart';

class PantallaMapa extends StatelessWidget {
  const PantallaMapa({super.key});

  static const LatLng ubicacionElCubo = LatLng(2.4581561, -76.5982607);

  // Abrir las indicaciones hacia El Cubo.
  Future<void> _abrirComoLlegar(BuildContext context) async {
    final url = Uri.https('www.google.com', '/maps/dir/', {
      'api': '1',
      'destination': '2.4581561,-76.5982607',
      'travelmode': 'driving',
    });

    try {
      final abierto = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!context.mounted) return;

      if (abierto) {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir Google Maps.')),
        );
      }
    } catch (_) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al abrir la ubicación.')),
      );
    }
  }

  // Mostrar las canchas disponibles.
  void _mostrarCanchas(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: ColoresAplicacion.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (contextHoja) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Canchas Sintéticas El Cubo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColoresAplicacion.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 17,
                        color: ColoresAplicacion.primary,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Popayán, Cauca',
                        style: TextStyle(
                          fontSize: 13,
                          color: ColoresAplicacion.textMuted,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Selecciona una cancha para ver sus detalles',
                    style: TextStyle(
                      fontSize: 13,
                      color: ColoresAplicacion.textMuted,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Listado de canchas.
                  ...DatosCanchas.canchas.map((cancha) {
                    return Card(
                      color: ColoresAplicacion.surfaceSecondary,
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: const CircleAvatar(
                          backgroundColor: ColoresAplicacion.primaryLight,
                          child: Icon(
                            Icons.sports_soccer,
                            color: ColoresAplicacion.primaryDark,
                          ),
                        ),
                        title: Text(
                          cancha.nombre,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${cancha.zona}\n'
                          '\$${cancha.precio} COP',
                        ),
                        isThreeLine: true,
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: ColoresAplicacion.primary,
                        ),
                        onTap: () {
                          Navigator.pop(contextHoja);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PantallaDetalleCancha(cancha: cancha),
                            ),
                          );
                        },
                      ),
                    );
                  }),

                  const SizedBox(height: 12),

                  // Botón Cómo llegar.
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _abrirComoLlegar(contextHoja);
                      },
                      icon: const Icon(Icons.directions),
                      label: const Text(
                        'Cómo llegar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColoresAplicacion.primaryDark,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 52),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresAplicacion.background,
      appBar: AppBar(
        title: const Text(
          'Mapa de canchas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColoresAplicacion.surface,
        surfaceTintColor: ColoresAplicacion.surface,
        actions: [
          IconButton(
            tooltip: 'Información del mapa',
            icon: const Icon(
              Icons.info_outline,
              color: ColoresAplicacion.primary,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Selecciona el marcador para '
                    'consultar las canchas disponibles.',
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: Stack(
        children: [
          // Mapa interactivo.
          FlutterMap(
            options: const MapOptions(
              initialCenter: ubicacionElCubo,
              initialZoom: 16.5,
              minZoom: 4,
              maxZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'futzone_mobile',
              ),

              // Marcador interactivo de El Cubo.
              MarkerLayer(
                markers: [
                  Marker(
                    point: ubicacionElCubo,
                    width: 60,
                    height: 60,
                    child: GestureDetector(
                      onTap: () {
                        _mostrarCanchas(context);
                      },
                      child: const Icon(
                        Icons.location_on,
                        size: 48,
                        color: ColoresAplicacion.primaryDeep,
                      ),
                    ),
                  ),
                ],
              ),

              const RichAttributionWidget(
                attributions: [
                  TextSourceAttribution('OpenStreetMap contributors'),
                ],
              ),
            ],
          ),

          // Encabezado flotante.
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColoresAplicacion.surface,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.sports_soccer,
                    color: ColoresAplicacion.primary,
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explora las canchas',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColoresAplicacion.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Descubre dónde jugar tu próximo partido',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColoresAplicacion.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Información inferior.
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColoresAplicacion.primaryDeep,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Toca el marcador verde para '
                      'explorar las canchas de El Cubo '
                      'y consultar cómo llegar.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
