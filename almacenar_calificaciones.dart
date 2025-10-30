import 'dart:io';
import 'dart:math';

void main() {
  // Crear un Map para almacenar calificaciones
  Map<String, double> calificaciones = {
    'Matemáticas': 9.5,
    'Español': 8.0,
    'Ciencias': 7.5,
    'Historia': 9.0,
  };

  // Generar un nombre de archivo aleatorio
  String nombreArchivo = generarNombreAleatorio();

  // Guardar el Map en un archivo
  File archivo = File(nombreArchivo);
  try {
    archivo.writeAsStringSync('Calificaciones:\n');
    calificaciones.forEach((materia, calificacion) {
      archivo.writeAsStringSync('$materia: $calificacion\n', mode: FileMode.append);
    });
    print('Calificaciones guardadas en: $nombreArchivo');
  } catch (e) {
    print('Error al escribir en el archivo: $e');
  }
}

String generarNombreAleatorio() {
  const caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  String nombre = 'calificaciones_';
  for (int i = 0; i < 10; i++) {
    nombre += caracteres[random.nextInt(caracteres.length)];
  }
  nombre += '.txt';
  return nombre;
}