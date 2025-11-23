import 'package:flutter/material.dart';
import './pantalla_base.dart';
import '../models/alimento.dart';

class DetallePage extends StatelessWidget {
  final Alimento alimento;

  const DetallePage({required this.alimento});

  @override
  Widget build(BuildContext context) {
    final bool esFavorito = favoritos.contains(alimento);

    return PantallaBase(
      contenido: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(alimento.imagen, height: 200, fit: BoxFit.cover),
            SizedBox(height: 20),
            Text(
              alimento.nombre,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              alimento.descripcion,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Beneficios',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...alimento.beneficios.map((b) => ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text(b),
                )),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(
                esFavorito ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
              label: Text(esFavorito ? "Ya está en Favoritos" : "Agregar a Favoritos"),
              onPressed: () {
                if (!esFavorito) {
                  favoritos.add(alimento);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Agregado a favoritos")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Este alimento ya está en favoritos")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
