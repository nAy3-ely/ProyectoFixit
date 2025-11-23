import 'package:flutter/material.dart';
import './pantalla_base.dart';
import '../models/servicio.dart';

class SolicitudesPage extends StatelessWidget {
  Color _colorEstado(String estado) {
    switch (estado) {
      case 'En espera':
        return Colors.blue;
      case 'En camino':
        return Colors.orange;
      case 'Aprobada':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PantallaBase(
      currentIndex: 2,
      contenido: Padding(
        padding: const EdgeInsets.all(16.0),
        child: solicitudes.isEmpty
            ? Center(child: Text('No tienes solicitudes aún.'))
            : ListView.builder(
                itemCount: solicitudes.length,
                itemBuilder: (context, index) {
                  final a = solicitudes[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        a.imagen,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(a.nombre),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a.categoria),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.circle, size: 12, color: _colorEstado(a.estado)),
                              SizedBox(width: 6),
                              Text(
                                a.estado,
                                style: TextStyle(
                                  color: _colorEstado(a.estado),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          a.estado = value;
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 'En espera', child: Text('En espera')),
                          PopupMenuItem(value: 'En camino', child: Text('En camino')),
                          PopupMenuItem(value: 'Aprobada', child: Text('Aprobada')),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
