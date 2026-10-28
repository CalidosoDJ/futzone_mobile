import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/colores_app.dart';

class PantallaInicioJugador extends StatefulWidget {
  const PantallaInicioJugador({super.key});

  @override
  State<PantallaInicioJugador> createState() => _PantallaInicioJugadorState();
}

class _PantallaInicioJugadorState extends State<PantallaInicioJugador> {
  int _indiceNavegacion = 0;

  final String _imagenHero =
      'https://images.unsplash.com/photo-1508098682722-e99c43a406b2?q=80&w=800&auto=format&fit=crop';
  final String _imagenCancha1 =
      'https://images.unsplash.com/photo-1574629810360-7efbbe195018?q=80&w=800&auto=format&fit=crop';
  final String _imagenCancha2 =
      'https://images.unsplash.com/photo-1529900748604-07564a03e7a6?q=80&w=800&auto=format&fit=crop';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresApp.fondoPantalla,
      appBar: _construirAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _construirHeroCard(),
            const SizedBox(height: 24),
            _construirVentajasCampeon(),
            const SizedBox(height: 28),
            _construirSeccionCanchas(),
            const SizedBox(height: 28),
            _construirConveniosCard(),
            const SizedBox(height: 24),
            _construirSobreNosotros(),
            const SizedBox(height: 24),
            _construirPreguntasFrecuentes(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: _construirBottomNav(),
    );
  }

  // 1. NAVBAR SUPERIOR
  PreferredSizeWidget _construirAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B132B),
      elevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: ColoresApp.verdeBoton,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.sports_soccer,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'FutZone',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: ColoresApp.verdeBoton.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'DASHBOARD',
              style: GoogleFonts.plusJakartaSans(
                color: ColoresApp.verdeBoton,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {},
        ),
        Container(
          margin: const EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColoresApp.verdeBoton, width: 1.5),
          ),
          child: const CircleAvatar(
            radius: 14,
            backgroundColor: Color(0xFF1C2541),
            child: Icon(Icons.person, color: Colors.white, size: 16),
          ),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------------
  // 2. HERO PRINCIPAL CON BÚSQUEDA RÁPIDA
  // ---------------------------------------------------------------------------
  Widget _construirHeroCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: Image.network(_imagenHero, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.sports_soccer,
                          color: ColoresApp.verdeBorde,
                          size: 12,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '¡Hola, Jugador! Bienvenido a FutZone',
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                        color: Colors.white,
                      ),
                      children: const [
                        TextSpan(text: 'Tu próximo partido\n'),
                        TextSpan(
                          text: 'comienza aquí',
                          style: TextStyle(color: ColoresApp.verdeBoton),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Encuentra y reserva al instante las mejores canchas sintéticas con iluminación profesional y césped certificado.',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColoresApp.verdeBoton,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Reservar cancha →',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: Colors.white24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.calendar_month_outlined, size: 16),
                      label: Text(
                        'Mis reservas',
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Búsqueda Rápida
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.tune_rounded,
                            color: Colors.white70,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'BÚSQUEDA RÁPIDA',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'En vivo',
                        style: GoogleFonts.plusJakartaSans(
                          color: ColoresApp.verdeBoton,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _crearChipFiltro('FECHA', 'Hoy', Icons.calendar_today),
                      const SizedBox(width: 8),
                      _crearChipFiltro('HORA', '18:00+', Icons.access_time),
                      const SizedBox(width: 8),
                      _crearChipFiltro(
                        'FORMATO',
                        'Fútbol 7 & F5',
                        Icons.sports_soccer,
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

  Widget _crearChipFiltro(String titulo, String valor, IconData icono) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          children: [
            Text(
              titulo,
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white38,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icono, color: ColoresApp.verdeBoton, size: 12),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    valor,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 3. VENTAJAS DE CAMPEÓN (IMAGEN CUBRIENDO EL 100% DEL RECUADRO)
  // ---------------------------------------------------------------------------
  Widget _construirVentajasCampeon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'VENTAJAS DE CAMPEÓN',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: ColoresApp.textoDesactivado,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '¿Por qué elegir FutZone?',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: ColoresApp.textoTitulo,
            ),
          ),
          const SizedBox(height: 14),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1, // Proporción cuadrada perfecta
            children: [
              _crearCardVentaja(
                rutaImagenLocal: 'assets/images/canchas1.jpg',
                icono: Icons.grid_view_rounded,
                numero: '3',
                titulo: 'Canchas activas',
                subtitulo: 'Césped sintético FIFA Quality Pro.',
              ),
              _crearCardVentaja(
                rutaImagenLocal: 'assets/images/disponibilidad.png',
                icono: Icons.access_time_rounded,
                numero: '24/7',
                titulo: 'Disponibilidad',
                subtitulo: 'Turnos en vivo con confirmación.',
              ),
              _crearCardVentaja(
                rutaImagenLocal: 'assets/images/reserva.jpg',
                icono: Icons.bolt_rounded,
                numero: '100%',
                titulo: 'Reservas online',
                subtitulo: 'Confirmación al instante sin esperas.',
              ),
              _crearCardVentaja(
                rutaImagenLocal: 'assets/images/security.jpg',
                icono: Icons.shield_outlined,
                numero: 'Sistema Seguro',
                titulo: 'Pagos Blindados',
                subtitulo: 'Reembolso garantizado y soporte.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearCardVentaja({
    required String rutaImagenLocal,
    required IconData icono,
    required String numero,
    required String titulo,
    required String subtitulo,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColoresApp.bordeDivisor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // 1. IMAGEN LLENANDO EL 100% DEL FONDO
            Positioned.fill(
              child: Image.asset(
                rutaImagenLocal,
                fit: BoxFit
                    .cover, // Llena todo el marco sin dejar espacios blancos
                errorBuilder: (context, error, stackTrace) => Container(
                  color: ColoresApp.verdeFondoSuave,
                  child: const Center(
                    child: Icon(
                      Icons.sports_soccer,
                      color: ColoresApp.verdeBoton,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),

            // 2. OVERLAY OSCURO PARA GARANTIZAR LECTURA DE TEXTOS
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.25),
                      Colors.black.withValues(alpha: 0.85),
                    ],
                  ),
                ),
              ),
            ),

            // 3. CONTENIDO (ÍCONO ARRIBA Y TEXTO ABAJO)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Ícono flotante en la esquina superior izquierda
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Icon(icono, color: Colors.white, size: 16),
                  ),

                  // Textos en la parte inferior
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        numero,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        titulo,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        subtitulo,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 9,
                          color: Colors.white70,
                          height: 1.15,
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

  // ---------------------------------------------------------------------------
  // 4. SECCIÓN DE CANCHAS DISPONIBLES
  // ---------------------------------------------------------------------------
  Widget _construirSeccionCanchas() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CANCHAS DISPONIBLES HOY',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: ColoresApp.textoDesactivado,
                      letterSpacing: 0.8,
                    ),
                  ),
                  Text(
                    'Elige tu campo de juego',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: ColoresApp.textoTitulo,
                    ),
                  ),
                ],
              ),
              Text(
                'Ver todas (6)',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: ColoresApp.verdeBoton,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _crearCardCancha(
            imagenUrl: _imagenCancha1,
            nombre: 'Cancha 1',
            ubicacion: 'El Cubo',
            precio: '\$110.000',
            rating: '4.9 (128)',
            tags: [
              'Fútbol 7',
              'Techado',
              'Foco LED 400W',
              'Vestuarios',
              'Gras Pro',
            ],
          ),
          const SizedBox(height: 16),
          _crearCardCancha(
            imagenUrl: _imagenCancha2,
            nombre: 'Cancha 2',
            ubicacion: 'El Cubo',
            precio: '\$120.000',
            rating: '4.8 (94)',
            tags: [
              'Fútbol 8',
              'Al aire libre',
              'Gras Sintético',
              'Arbitraje Opcional',
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearCardCancha({
    required String imagenUrl,
    required String nombre,
    required String ubicacion,
    required String precio,
    required String rating,
    required List<String> tags,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColoresApp.bordeDivisor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: Image.network(
                  imagenUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nombre,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: ColoresApp.textoTitulo,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: precio,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: ColoresApp.textoTitulo,
                            ),
                          ),
                          TextSpan(
                            text: ' /hora',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 10,
                              color: ColoresApp.textoDesactivado,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  ubicacion,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    color: ColoresApp.textoDesactivado,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: tags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: ColoresApp.fondoPantalla,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tag,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: ColoresApp.textoContenido,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: ColoresApp.verdeBoton,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '7 horarios libres',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: ColoresApp.textoTitulo,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColoresApp.verdeBoton,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Reservar →',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // 5. CONVENIOS & SECCIONES FINALES
  // ---------------------------------------------------------------------------
  Widget _construirConveniosCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: ColoresApp.verdeBoton,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'B2B & PARTNERS',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Convenios FutZone',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '¿Tienes un complejo deportivo o empresa? Conecta tu sede a miles de jugadores y optimiza tus horas muertas.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: Colors.white70,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: ColoresApp.verdeProfundo,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Crear alianza →',
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirSobreNosotros() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColoresApp.bordeDivisor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PASIÓN POR EL DEPORTE',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: ColoresApp.textoDesactivado,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Sobre Nosotros',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: ColoresApp.textoTitulo,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'En FutZone transformamos la cultura de la pichanga de barrio en una experiencia profesional. Conectamos deportistas apasionados con la mejor infraestructura deportiva del país.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                color: ColoresApp.textoContenido,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirPreguntasFrecuentes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DUDAS HABITUALES',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: ColoresApp.textoDesactivado,
            ),
          ),
          Text(
            'Preguntas Frecuentes',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: ColoresApp.textoTitulo,
            ),
          ),
          const SizedBox(height: 10),
          _crearItemFAQ('¿Cómo me registro o cancelo una reserva?'),
          _crearItemFAQ('¿Qué métodos de pago aceptan?'),
          _crearItemFAQ('¿Tienen estacionamiento y camerinos?'),
        ],
      ),
    );
  }

  Widget _crearItemFAQ(String pregunta) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColoresApp.bordeDivisor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              pregunta,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: ColoresApp.textoTitulo,
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ColoresApp.textoDesactivado,
          ),
        ],
      ),
    );
  }

  Widget _construirBottomNav() {
    return BottomNavigationBar(
      currentIndex: _indiceNavegacion,
      selectedItemColor: ColoresApp.verdeBoton,
      unselectedItemColor: ColoresApp.textoDesactivado,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.plusJakartaSans(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.plusJakartaSans(fontSize: 10),
      onTap: (index) => setState(() => _indiceNavegacion = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Canchas'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Reservas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
    );
  }
}
