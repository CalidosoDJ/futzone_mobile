import 'package:flutter/material.dart';

import '../../../tema/colores_aplicacion.dart';
import '../../../canchas/datos_canchas.dart';
import '../../../canchas/pantalla_explorar_canchas.dart';
import '../../../reservas/pantalla_mis_reservas.dart';

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresAplicacion.background,

      appBar: AppBar(
        title: const Text(
          'Mi perfil',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            tooltip: 'Notificaciones',
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: ColoresAplicacion.primaryDark,
              size: 27,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) {
                  return const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(28),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.notifications_off_outlined,
                            size: 56,
                            color: ColoresAplicacion.primary,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Tus notificaciones',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Aquí recibirás avisos sobre tus reservas, '
                            'partidos y novedades de FutZone.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: ColoresAplicacion.textMuted,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _construirEncabezado(),
            const SizedBox(height: 22),

            const Text(
              'Tu actividad deportiva',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: ColoresAplicacion.textPrimary,
              ),
            ),
            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _tarjetaEstadistica(
                    icono: Icons.sports_soccer,
                    valor: '${DatosCanchas.canchas.length}',
                    descripcion: 'Canchas disponibles',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _tarjetaEstadistica(
                    icono: Icons.event_available_outlined,
                    valor: 'Próximamente',
                    descripcion: 'Historial de reservas',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            const Text(
              'Accesos rápidos',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: ColoresAplicacion.textPrimary,
              ),
            ),
            const SizedBox(height: 14),

            _tarjetaAcceso(
              icono: Icons.calendar_month_outlined,
              titulo: 'Mis reservas',
              subtitulo: 'Consulta tu actividad deportiva',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PantallaMisReservas(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _tarjetaAcceso(
              icono: Icons.sports_soccer_outlined,
              titulo: 'Explorar canchas',
              subtitulo: 'Encuentra tu próximo partido',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PantallaExplorarCanchas(),
                  ),
                );
              },
            ),

            const SizedBox(height: 26),

            const Text(
              'Configuración de cuenta',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: ColoresAplicacion.textPrimary,
              ),
            ),
            const SizedBox(height: 14),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: ColoresAplicacion.border),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.manage_accounts_outlined,
                    size: 28,
                    color: ColoresAplicacion.primary,
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Datos personales',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Disponible al conectar la autenticación',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColoresAplicacion.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.lock_outline,
                    color: ColoresAplicacion.textMuted,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Center(
              child: Column(
                children: [
                  Text(
                    'FUTZONE',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                      color: ColoresAplicacion.primary,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Tu próxima pasión comienza aquí',
                    style: TextStyle(
                      fontSize: 11,
                      color: ColoresAplicacion.textMuted,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _construirEncabezado() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColoresAplicacion.primaryDeep,
              ColoresAplicacion.primaryDark,
              ColoresAplicacion.primary,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -45,
              top: -55,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.12),
                    width: 24,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -35,
              bottom: -75,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'FUTZONE  /  JUGADOR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.4,
                        ),
                      ),
                      Icon(
                        Icons.verified_outlined,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.white.withValues(alpha: 0.18),
                          child: const Icon(
                            Icons.person_rounded,
                            size: 42,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mi espacio deportivo',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Perfil de jugador',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFDCFCE7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.13),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.white, size: 17),
                        SizedBox(width: 9),
                        Expanded(
                          child: Text(
                            'Vista previa: inicia sesión cuando '
                            'la autenticación esté disponible.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tarjetaEstadistica({
    required IconData icono,
    required String valor,
    required String descripcion,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 145),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColoresAplicacion.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icono, color: ColoresAplicacion.primary, size: 28),
          const SizedBox(height: 14),
          Text(
            valor,
            style: TextStyle(
              fontSize: valor.length > 5 ? 14 : 25,
              fontWeight: FontWeight.w900,
              color: ColoresAplicacion.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            descripcion,
            style: const TextStyle(
              fontSize: 11,
              color: ColoresAplicacion.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tarjetaAcceso({
    required IconData icono,
    required String titulo,
    required String subtitulo,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: ColoresAplicacion.border),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: ColoresAplicacion.primaryLight,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icono, color: ColoresAplicacion.primaryDark),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ColoresAplicacion.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitulo,
                      style: const TextStyle(
                        fontSize: 11,
                        color: ColoresAplicacion.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: ColoresAplicacion.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
