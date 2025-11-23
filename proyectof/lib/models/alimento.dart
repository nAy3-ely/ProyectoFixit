class Alimento {
  final String nombre;
  final String categoria;
  final String imagen;
  final String descripcion;
  final List<String> beneficios;

  Alimento({
    required this.nombre,
    required this.categoria,
    required this.imagen,
    required this.descripcion,
    required this.beneficios,
  });
}

// Lista global para favoritos
List<Alimento> favoritos = [];
