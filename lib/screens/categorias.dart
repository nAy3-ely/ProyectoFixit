import 'package:flutter/material.dart';
import 'pantalla_base.dart';

class CategoriasPage extends StatelessWidget {
  final List<Map<String, dynamic>> categorias = [
    {
      'nombre': 'Plomería',
      'imagen': 'assets/images/plomeria.jpg',
      'ruta': '/buscar',
    },
    {
      'nombre': 'Electricidad',
      'imagen': 'assets/images/electricidad.jpg',
      'ruta': '/buscar',
    },
    {
      'nombre': 'Carpintería',
      'imagen': 'assets/images/carpinteria.jpg',
      'ruta': '/buscar',
    },
    {
      'nombre': 'Asistencia Doméstica',
      'imagen': 'assets/images/domestica.jpg',
      'ruta': '/buscar',
    },
    {
      'nombre': 'Cerrajería',
      'imagen': 'assets/images/cerrajeria.jpg',
      'ruta': '/buscar',
    },
    {
      'nombre': 'Jardinería',
      'imagen': 'assets/images/jardineria.jpg',
      'ruta': '/buscar',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PantallaBase(
      currentIndex: 0,
      contenido: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categorias.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = categorias[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  item['ruta'],
                  arguments: item['nombre'],
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(item['imagen']),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    item['nombre'],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black87,
                          blurRadius: 8,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
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
