import 'package:flutter/material.dart';
import './pantalla_base.dart';
import '../models/servicio.dart';

class DetallePage extends StatelessWidget {
  final Servicio servicio;

  const DetallePage({required this.servicio});

  @override
  Widget build(BuildContext context) {
    final bool esFavorito = solicitudes.contains(servicio);

    return PantallaBase(
      contenido: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(servicio.imagen, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              servicio.nombre,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              servicio.descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Habilidades',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...servicio.habilidades.map((b) => ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text(b),
                )),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(
                esFavorito ? Icons.event_note : Icons.event_note,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              label: Text(esFavorito ? "Ya está en Favoritos" : "Solicitar ahora"),
              onPressed: () {
                if (!esFavorito) {
                  solicitudes.add(servicio);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Solicitud enviada")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Ya se ha solicitado")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 151, 136, 119),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
