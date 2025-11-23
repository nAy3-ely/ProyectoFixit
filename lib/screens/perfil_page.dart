import 'package:flutter/material.dart';
import 'pantalla_base.dart';
import '../screens/user_session.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PantallaBase(
      contenido: _buildPerfil(context),
    );
  }

  Widget _buildPerfil(BuildContext context) {
    if (!UserSession.isLoggedIn) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_off, size: 80, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'Aún no has iniciado sesión',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text("Iniciar sesión"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/registro'),
              child: Text("Registrarse"),
            )
          ],
        ),
      );
    }

    // Si está logueado, mostrar perfil completo
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/usuario.jpg'),
          ),

          const SizedBox(height: 20),

          Text(
            UserSession.nombre,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          Text(
            UserSession.email,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),

          const SizedBox(height: 30),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              UserSession.logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
    );
  }
}
