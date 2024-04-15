class Tarea {
  String titulo;
  String descripcion;
  bool completado;

  Tarea({
    required this.titulo,
    required this.descripcion,
    this.completado = false,
  });

  // Método para convertir un objeto Tarea en un mapa para Firestore
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
      'completado': completado,
    };
  }
}