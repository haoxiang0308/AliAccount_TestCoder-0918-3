import 'dart:io';
import 'dart:math';

void main() {
  // Map para almacenar calificaciones
  Map<String, double> calificaciones = {
    'Matemáticas': 8.5,
    'Español': 9.0,
    'Ciencias': 7.8,
    'Historia': 8.2,
    'Inglés': 9.5,
  };

  // Imprimir las calificaciones almacenadas
  print('Calificaciones almacenadas:');
  calificaciones.forEach((materia, calificacion) {
    print('$materia: $calificacion');
  });

  // Guardar el Map en un archivo con nombre aleatorio
  var random = Random();
  var numeroAleatorio = random.nextInt(1000000); // Número aleatorio de hasta 6 dígitos
  var nombreArchivo = 'calificaciones_$numeroAleatorio.txt';

  var archivo = File(nombreArchivo);
  var sink = archivo.openWrite();
  
  sink.write('Calificaciones almacenadas:\n');
  calificaciones.forEach((materia, calificacion) {
    sink.write('$materia: $calificacion\n');
  });
  
  sink.close();

  print('\nLas calificaciones han sido guardadas en el archivo: $nombreArchivo');
}