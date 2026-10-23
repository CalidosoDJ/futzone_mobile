import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';

class SeccionBeneficios extends StatelessWidget {
  const SeccionBeneficios({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: ColoresAplicacion.darkSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColoresAplicacion.darkBorder),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _ElementoBeneficio(
              icono: Icons.verified_user_outlined,
              titulo: 'Reservas\nseguras',
              descripcion: 'Datos protegidos',
            ),
          ),
          Expanded(
            child: _ElementoBeneficio(
              icono: Icons.bolt_outlined,
              titulo: 'Proceso\nrápido',
              descripcion: 'En pocos clics',
            ),
          ),
          Expanded(
            child: _ElementoBeneficio(
              icono: Icons.star_outline_rounded,
              titulo: 'Mejores\ncanchas',
              descripcion: 'En Popayán',
            ),
          ),
        ],
      ),
    );
  }
}

class _ElementoBeneficio extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String descripcion;

  const _ElementoBeneficio({
    required this.icono,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icono, color: ColoresAplicacion.primary, size: 26),

          const SizedBox(height: 8),

          Text(
            titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            descripcion,
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
