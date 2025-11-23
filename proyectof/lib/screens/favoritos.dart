import 'package:flutter/material.dart';
import './pantalla_base.dart';
import '../models/alimento.dart';

class FavoritosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PantallaBase(
      currentIndex: 2,
      contenido: Padding(
        padding: const EdgeInsets.all(16.0),
        child: favoritos.isEmpty
            ? Center(child: Text('No tienes alimentos favoritos aún.'))
            : ListView.builder(
                itemCount: favoritos.length,
                itemBuilder: (context, index) {
                  final a = favoritos[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(a.imagen, width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(a.nombre),
                      subtitle: Text(a.categoria),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
