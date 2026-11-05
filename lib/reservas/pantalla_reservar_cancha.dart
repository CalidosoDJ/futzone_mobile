import 'package:flutter/material.dart';

import '../canchas/cancha.dart';
import '../tema/colores_aplicacion.dart';

class PantallaReservarCancha extends StatefulWidget {
  final Cancha cancha;

  const PantallaReservarCancha({super.key, required this.cancha});

  @override
  State<PantallaReservarCancha> createState() => _PantallaReservarCanchaState();
}

class _PantallaReservarCanchaState extends State<PantallaReservarCancha> {
  DateTime? fechaSeleccionada;
  String? horarioSeleccionado;
  bool requiereArbitro = false;
  String tipoArbitro = 'Profesional';

  final List<String> horarios = [
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
    '09:00 PM',
  ];

  Future<void> seleccionarFecha() async {
    final hoy = DateUtils.dateOnly(DateTime.now());

    final fecha = await showDatePicker(
      context: context,
      initialDate: fechaSeleccionada ?? hoy,
      firstDate: hoy,
      lastDate: DateTime(hoy.year + 1, hoy.month, hoy.day),
      helpText: 'Selecciona la fecha de tu reserva',
    );

    if (fecha != null && mounted) {
      setState(() {
        fechaSeleccionada = fecha;
        horarioSeleccionado = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cancha = widget.cancha;
    final precioArbitro = requiereArbitro ? 50000 : 0;
    final totalReserva = cancha.precio + precioArbitro;

    String formatoPrecio(int valor) {
      final numero = valor.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (_) => '.',
      );
      return '\$$numero';
    }

    final fechaTexto = fechaSeleccionada == null
        ? 'Seleccionar fecha'
        : '${fechaSeleccionada!.day.toString().padLeft(2, '0')}/'
              '${fechaSeleccionada!.month.toString().padLeft(2, '0')}/'
              '${fechaSeleccionada!.year}';

    return Scaffold(
      backgroundColor: ColoresAplicacion.darkBackground,
      appBar: AppBar(
        backgroundColor: ColoresAplicacion.darkBackground,
        foregroundColor: Colors.white,
        title: const Text('Reservar cancha'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    cancha.imagen,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => const Center(
                      child: Icon(
                        Icons.sports_soccer,
                        color: ColoresAplicacion.primary,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                cancha.nombre,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: ColoresAplicacion.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      cancha.direccion,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'Selecciona la fecha',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              OutlinedButton.icon(
                onPressed: seleccionarFecha,
                icon: const Icon(Icons.calendar_month_outlined),
                label: Text(fechaTexto),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 54),
                  side: const BorderSide(color: ColoresAplicacion.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Selecciona un horario',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Horarios de referencia. La disponibilidad real '
                'se verificará al conectar el backend.',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),

              const SizedBox(height: 16),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: horarios.map((horario) {
                  final seleccionado = horarioSeleccionado == horario;

                  return ChoiceChip(
                    label: Text(horario),
                    selected: seleccionado,
                    onSelected: fechaSeleccionada == null
                        ? null
                        : (_) {
                            setState(() {
                              horarioSeleccionado = horario;
                            });
                          },
                    selectedColor: ColoresAplicacion.primary,
                    backgroundColor: ColoresAplicacion.darkSurface,
                    labelStyle: TextStyle(
                      color: seleccionado ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                    side: const BorderSide(color: ColoresAplicacion.darkBorder),
                  );
                }).toList(),
              ),

              const SizedBox(height: 28),

              const Text(
                'Servicio de árbitro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                '¿Deseas contratar un árbitro para tu partido?',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),

              const SizedBox(height: 12),

              SwitchListTile(
                title: Text(
                  requiereArbitro
                      ? 'Sí, necesito árbitro'
                      : 'No necesito árbitro',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Servicio adicional: \$50.000',
                  style: TextStyle(color: Colors.white70),
                ),
                value: requiereArbitro,
                activeTrackColor: ColoresAplicacion.primary,
                onChanged: (valor) {
                  setState(() {
                    requiereArbitro = valor;
                  });
                },
              ),

              if (requiereArbitro) ...[
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  initialValue: tipoArbitro,
                  dropdownColor: ColoresAplicacion.darkSurface,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Tipo de árbitro',
                    labelStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Profesional',
                      child: Text('Árbitro profesional'),
                    ),
                    DropdownMenuItem(
                      value: 'Amateur',
                      child: Text('Árbitro amateur'),
                    ),
                  ],
                  onChanged: (valor) {
                    if (valor != null) {
                      setState(() {
                        tipoArbitro = valor;
                      });
                    }
                  },
                ),
              ],

              const SizedBox(height: 24),

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
                      'Resumen de la reserva',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Cancha: ${cancha.nombre}',
                      style: const TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Fecha: $fechaTexto',
                      style: const TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Hora: ${horarioSeleccionado ?? "No seleccionada"}',
                      style: const TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Zona: ${cancha.zona}',
                      style: const TextStyle(color: Colors.white70),
                    ),

                    const Divider(height: 32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Precio por hora',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          formatoPrecio(cancha.precio),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Servicio de árbitro',
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          formatoPrecio(precioArbitro),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    if (requiereArbitro) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Árbitro: $tipoArbitro',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],

                    const Divider(height: 32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          formatoPrecio(totalReserva),
                          style: const TextStyle(
                            color: ColoresAplicacion.primary,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
