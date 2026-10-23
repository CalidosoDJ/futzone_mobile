import 'package:flutter/material.dart';

import '../tema/colores_aplicacion.dart';
import 'pantalla_inicio_sesion.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final _formulario = GlobalKey<FormState>();

  final _nombre = TextEditingController();
  final _usuario = TextEditingController();
  final _correo = TextEditingController();
  final _celular = TextEditingController();
  final _contrasena = TextEditingController();
  final _confirmacion = TextEditingController();

  bool _mostrarContrasena = false;
  bool _mostrarConfirmacion = false;

  @override
  void dispose() {
    _nombre.dispose();
    _usuario.dispose();
    _correo.dispose();
    _celular.dispose();
    _contrasena.dispose();
    _confirmacion.dispose();
    super.dispose();
  }

  void _registrarse() {
    FocusScope.of(context).unfocus();

    if (!_formulario.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'El registro estará disponible cuando '
          'conectemos el servicio de autenticación.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  InputDecoration _decoracionCampo({
    required String etiqueta,
    required IconData icono,
    Widget? sufijo,
  }) {
    OutlineInputBorder borde(Color color, {double ancho = 1}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: ancho),
      );
    }

    return InputDecoration(
      labelText: etiqueta,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelStyle: const TextStyle(color: Colors.white60, fontSize: 13),
      floatingLabelStyle: const TextStyle(
        color: ColoresAplicacion.primary,
        fontSize: 13,
      ),
      prefixIcon: Icon(icono, color: ColoresAplicacion.primary, size: 21),
      suffixIcon: sufijo,
      isDense: true,
      filled: true,
      fillColor: ColoresAplicacion.darkSurface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      border: borde(ColoresAplicacion.darkBorder),
      enabledBorder: borde(ColoresAplicacion.darkBorder),
      focusedBorder: borde(ColoresAplicacion.primary, ancho: 2),
      errorBorder: borde(Colors.redAccent),
      focusedErrorBorder: borde(Colors.redAccent, ancho: 2),
    );
  }

  Widget _campo({
    required String etiqueta,
    required IconData icono,
    required TextEditingController controlador,
    TextInputType? teclado,
    TextInputAction accion = TextInputAction.next,
    TextCapitalization capitalizacion = TextCapitalization.none,
    String? Function(String?)? validar,
    List<String>? autocompletar,
  }) {
    return TextFormField(
      controller: controlador,
      keyboardType: teclado,
      textInputAction: accion,
      textCapitalization: capitalizacion,
      autofillHints: autocompletar,
      style: const TextStyle(color: Colors.white, fontSize: 14),
      decoration: _decoracionCampo(etiqueta: etiqueta, icono: icono),
      validator: validar,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColoresAplicacion.darkBackground,
      appBar: AppBar(
        backgroundColor: ColoresAplicacion.darkBackground,
        elevation: 0,
        toolbarHeight: 48,
        leading: IconButton(
          tooltip: 'Volver',
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, restricciones) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: restricciones.maxHeight - 20,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: restricciones.maxHeight - 20,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),

                      child: Form(
                        key: _formulario,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/logo_futzone.jpeg',
                                    width: 46,
                                    height: 46,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text.rich(
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
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            const Text(
                              '¡Únete a FutZone!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              'Crea tu cuenta y vive tu próximo partido.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 18),

                            _campo(
                              etiqueta: 'Nombre completo',
                              icono: Icons.person_outline_rounded,
                              controlador: _nombre,
                              capitalizacion: TextCapitalization.words,
                              autocompletar: const [AutofillHints.name],
                              validar: (valor) {
                                final nombre = valor?.trim() ?? '';
                                if (nombre.isEmpty) {
                                  return 'Ingresa tu nombre completo';
                                }
                                if (nombre.length < 3) {
                                  return 'Mínimo 3 caracteres';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            _campo(
                              etiqueta: 'Nombre de usuario',
                              icono: Icons.alternate_email_rounded,
                              controlador: _usuario,
                              validar: (valor) {
                                final usuario = valor?.trim() ?? '';
                                if (usuario.isEmpty) {
                                  return 'Ingresa un usuario';
                                }
                                if (usuario.length < 3) {
                                  return 'Mínimo 3 caracteres';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            _campo(
                              etiqueta: 'Correo electrónico',
                              icono: Icons.mail_outline_rounded,
                              controlador: _correo,
                              teclado: TextInputType.emailAddress,
                              autocompletar: const [AutofillHints.email],
                              validar: (valor) {
                                final correo = valor?.trim() ?? '';

                                if (correo.isEmpty) {
                                  return 'Ingresa tu correo';
                                }

                                if (!RegExp(
                                  r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                                ).hasMatch(correo)) {
                                  return 'Correo no válido';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            _campo(
                              etiqueta: 'Número de celular',
                              icono: Icons.phone_android_rounded,
                              controlador: _celular,
                              teclado: TextInputType.phone,
                              autocompletar: const [
                                AutofillHints.telephoneNumber,
                              ],
                              validar: (valor) {
                                final numero = valor?.trim() ?? '';

                                if (numero.isEmpty) {
                                  return 'Ingresa tu celular';
                                }

                                if (!RegExp(r'^\d{10}$').hasMatch(numero)) {
                                  return 'Debe tener 10 dígitos';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            TextFormField(
                              controller: _contrasena,
                              obscureText: !_mostrarContrasena,
                              textInputAction: TextInputAction.next,
                              autofillHints: const [AutofillHints.newPassword],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: _decoracionCampo(
                                etiqueta: 'Contraseña',
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
                                    size: 21,
                                  ),
                                ),
                              ),
                              validator: (valor) {
                                if (valor == null || valor.isEmpty) {
                                  return 'Crea una contraseña';
                                }
                                if (valor.length < 8) {
                                  return 'Mínimo 8 caracteres';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 10),

                            TextFormField(
                              controller: _confirmacion,
                              obscureText: !_mostrarConfirmacion,
                              textInputAction: TextInputAction.done,
                              autofillHints: const [AutofillHints.newPassword],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              decoration: _decoracionCampo(
                                etiqueta: 'Confirmar contraseña',
                                icono: Icons.lock_reset_rounded,
                                sufijo: IconButton(
                                  tooltip: _mostrarConfirmacion
                                      ? 'Ocultar contraseña'
                                      : 'Mostrar contraseña',
                                  onPressed: () {
                                    setState(() {
                                      _mostrarConfirmacion =
                                          !_mostrarConfirmacion;
                                    });
                                  },
                                  icon: Icon(
                                    _mostrarConfirmacion
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.white70,
                                    size: 21,
                                  ),
                                ),
                              ),
                              validator: (valor) {
                                if (valor == null || valor.isEmpty) {
                                  return 'Confirma tu contraseña';
                                }
                                if (valor != _contrasena.text) {
                                  return 'Las contraseñas no coinciden';
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) => _registrarse(),
                            ),

                            const SizedBox(height: 18),

                            SizedBox(
                              height: 48,
                              child: ElevatedButton(
                                onPressed: _registrarse,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColoresAplicacion.primary,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Registrarse',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Flexible(
                                  child: Text(
                                    '¿Ya tienes cuenta?',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PantallaInicioSesion(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Inicia sesión',
                                    style: TextStyle(
                                      color: ColoresAplicacion.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
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
          },
        ),
      ),
    );
  }
}
