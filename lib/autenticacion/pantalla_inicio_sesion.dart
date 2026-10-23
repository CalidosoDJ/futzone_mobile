import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';
import 'pantalla_registro.dart';

class PantallaInicioSesion extends StatefulWidget {
  const PantallaInicioSesion({super.key});

  @override
  State<PantallaInicioSesion> createState() => _PantallaInicioSesionState();
}

class _PantallaInicioSesionState extends State<PantallaInicioSesion> {
  final _formulario = GlobalKey<FormState>();

  final _correo = TextEditingController();
  final _contrasena = TextEditingController();

  bool _mostrarContrasena = false;

  @override
  void dispose() {
    _correo.dispose();
    _contrasena.dispose();
    super.dispose();
  }

  void _iniciarSesion() {
    FocusScope.of(context).unfocus();

    if (!_formulario.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'El inicio de sesión estará disponible '
          'cuando conectemos el servicio de autenticación.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  InputDecoration _decoracionCampo({
    required String texto,
    required IconData icono,
    Widget? sufijo,
  }) {
    return InputDecoration(
      hintText: texto,
      hintStyle: const TextStyle(color: Colors.white54),
      prefixIcon: Icon(icono, color: ColoresAplicacion.primary),
      suffixIcon: sufijo,
      filled: true,
      fillColor: ColoresAplicacion.darkSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: ColoresAplicacion.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: ColoresAplicacion.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: ColoresAplicacion.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresAplicacion.darkBackground,
      appBar: AppBar(
        backgroundColor: ColoresAplicacion.darkBackground,
        elevation: 0,
        leading: IconButton(
          tooltip: 'Volver',
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formulario,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo_futzone.jpeg',
                          width: 76,
                          height: 76,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    const Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Fut',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Zone',
                              style: TextStyle(
                                color: ColoresAplicacion.primary,
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      '¡Qué bueno verte de nuevo!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Inicia sesión y prepárate '
                      'para tu próximo partido.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 36),

                    const Text(
                      'Correo electrónico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _correo,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(color: Colors.white),
                      decoration: _decoracionCampo(
                        texto: 'ejemplo@correo.com',
                        icono: Icons.mail_outline_rounded,
                      ),
                      validator: (valor) {
                        final correo = valor?.trim() ?? '';

                        if (correo.isEmpty) {
                          return 'Ingresa tu correo electrónico';
                        }

                        final formatoCorreo = RegExp(
                          r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                        );

                        if (!formatoCorreo.hasMatch(correo)) {
                          return 'Ingresa un correo válido';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'Contraseña',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _contrasena,
                      obscureText: !_mostrarContrasena,
                      textInputAction: TextInputAction.done,
                      autofillHints: const [AutofillHints.password],
                      style: const TextStyle(color: Colors.white),
                      decoration: _decoracionCampo(
                        texto: 'Ingresa tu contraseña',
                        icono: Icons.lock_outline_rounded,
                        sufijo: IconButton(
                          tooltip: _mostrarContrasena
                              ? 'Ocultar contraseña'
                              : 'Mostrar contraseña',
                          onPressed: () {
                            setState(() {
                              _mostrarContrasena = !_mostrarContrasena;
                            });
                          },
                          icon: Icon(
                            _mostrarContrasena
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      validator: (valor) {
                        if (valor == null || valor.isEmpty) {
                          return 'Ingresa tu contraseña';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => _iniciarSesion(),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _iniciarSesion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColoresAplicacion.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Iniciar sesión',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          child: Text(
                            '¿Aún no tienes cuenta?',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PantallaRegistro(),
                              ),
                            );
                          },
                          child: const Text(
                            'Regístrate',
                            style: TextStyle(
                              color: ColoresAplicacion.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
