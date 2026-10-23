import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';

class EncabezadoInicio extends StatelessWidget implements PreferredSizeWidget {
  const EncabezadoInicio({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColoresAplicacion.darkBackground,
      elevation: 0,
      toolbarHeight: 64,
      titleSpacing: 16,
      automaticallyImplyLeading: false,

      title: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/logo_futzone.jpeg',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 10),

          const Expanded(
            child: Text.rich(
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),

      actions: [
        PopupMenuButton<String>(
          tooltip: 'Abrir menú',
          icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 27),
          color: ColoresAplicacion.darkSurface,
          onSelected: (opcion) {
            if (opcion == 'inicio') {
              // Ya estamos en la pantalla de inicio.
              return;
            }

            if (opcion == 'canchas') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Desliza hacia abajo para explorar las canchas.',
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem<String>(
              value: 'inicio',
              child: Row(
                children: [
                  Icon(Icons.home_outlined, color: ColoresAplicacion.primary),
                  SizedBox(width: 12),
                  Text('Inicio', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'canchas',
              child: Row(
                children: [
                  Icon(
                    Icons.sports_soccer_outlined,
                    color: ColoresAplicacion.primary,
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Explorar canchas',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(width: 8),
      ],
    );
  }
}
