import 'package:flutter/material.dart';

class PantallaBase extends StatelessWidget {
  final Widget contenido;
  final int currentIndex;

  const PantallaBase({required this.contenido, this.currentIndex = 0, Key? key}) : super(key: key);

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Nayhely Valle"),
            accountEmail: Text("ngt.valle@yavirac.edu.ec"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/usuario.jpg'),
            ),
            decoration: BoxDecoration(color: Color.fromARGB(255, 126, 116, 115)),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () => Navigator.pushNamed(context, '/login'),
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Registro'),
            onTap: () => Navigator.pushNamed(context, '/registro'),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Descripción'),
            onTap: () => Navigator.pushNamed(context, '/descripcion'),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categorías'),
            onTap: () => Navigator.pushNamed(context, '/categorias'),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Buscar'),
            onTap: () => Navigator.pushNamed(context, '/buscar'),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            onTap: () => Navigator.pushNamed(context, '/favoritos'),
          ),
          ListTile(
            leading: Icon(Icons.dynamic_form_outlined),
            title: Text('Formulario'),
            onTap: () => Navigator.pushNamed(context, '/formulario'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Opciones'),
            onTap: () => Navigator.pushNamed(context, '/opciones'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar sesión'),
            onTap: () => Navigator.popUntil(context, ModalRoute.withName('/')),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFFFF3E0), // Color crema/durazno claro
      selectedItemColor: Color(0xFFE64A19), // Naranja tipo papaya
      unselectedItemColor: Color(0xFF795548), // Marrón de semillas o nuez
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/'); //no mover esto para nada chucha
            break;
          case 1:
            Navigator.pushNamed(context, '/login');
            break;
          case 2:
            Navigator.pushNamed(context, '/favoritos');
            break;
          case 3:
            Navigator.pushNamed(context, '/buscar');
            break;
          case 4:
            Navigator.pushNamed(context, '/opciones');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Opciones'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FIX IT!!')),
      drawer: _buildDrawer(context),
      body: contenido,
      bottomNavigationBar: _buildBottomBar(context),
    );
  }
}
