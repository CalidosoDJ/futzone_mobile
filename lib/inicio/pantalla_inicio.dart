import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';
import 'encabezado_inicio.dart';
import 'seccion_principal.dart';
import 'seccion_beneficios.dart';
import 'seccion_canchas.dart';
import 'seccion_nosotros.dart';
import 'pie_pagina.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresAplicacion.darkBackground,

      appBar: const EncabezadoInicio(),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            SeccionPrincipal(),
            SeccionBeneficios(),
            SeccionCanchas(),
            SeccionNosotros(),
            PiePagina(),
          ],
        ),
      ),
    );
  }
}
