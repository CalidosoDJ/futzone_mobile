import 'cancha.dart';

abstract final class DatosCanchas {
  static const List<Cancha> canchas = [
    Cancha(
      id: 1,
      nombre: 'Cancha Sintética #1',
      zona: 'Fútbol 5',
      direccion: 'Centro Deportivo El Cubo',
      telefono: '3106021273',
      precio: 90000,
      imagen: 'assets/images/cancha1.jpg',
      calificacion: 4.9,
    ),
    Cancha(
      id: 2,
      nombre: 'Cancha Sintética #2',
      zona: 'Fútbol 5',
      direccion: 'Centro Deportivo El Cubo',
      telefono: '3106021273',
      precio: 90000,
      imagen: 'assets/images/cancha2.jpg',
      calificacion: 4.8,
    ),
  ];
}
