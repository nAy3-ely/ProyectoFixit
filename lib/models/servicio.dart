class Servicio {
  final String nombre;              // Nombre del oficio o servicio
  final String categoria;           // Categoría: plomería, electricidad, limpieza...
  final String imagen;              // Imagen del servicio o trabajador
  final String descripcion;         // Descripción del servicio
  final List<String> habilidades;   // Lista de habilidades o cosas que ofrece
  String estado;                    // Estado de la solicitud: En espera, En camino, etc.

  Servicio({
    required this.nombre,
    required this.categoria,
    required this.imagen,
    required this.descripcion,
    required this.habilidades,
    this.estado = "En espera", // Estado inicial
  });
}

// Lista global para solicitudes
List<Servicio> solicitudes = [];
