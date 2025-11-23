import 'package:flutter/material.dart';

class PantallaBase extends StatefulWidget {
  final Widget contenido;
  final int currentIndex;

  const PantallaBase({
    required this.contenido,
    this.currentIndex = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<PantallaBase> createState() => _PantallaBaseState();
}

class _PantallaBaseState extends State<PantallaBase> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int navDrawerIndex = 0;

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

        final List<String> rutas = [

          '/descripcion',
          '/categorias',
          '/buscar',         
          '/solicitudes',
          '/formulario',
          '/perfil_page', // no mover nada

        ];


          Navigator.pushReplacementNamed(context, rutas[value]);
          _scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          // ⭐ MI CUENTA
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/images/usuario.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nayhely Valle',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'ngt.valle@yavirac.edu.ec',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Divider(),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text(
              'Menú Principal',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

        
          const NavigationDrawerDestination(
              icon: Icon(Icons.description), label: Text('Descripción')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.category), label: Text('Categorías')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.search), label: Text('Buscar')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.event_note), label: Text('Solicitudes')),
          const NavigationDrawerDestination(
              icon: Icon(Icons.dynamic_form_outlined),
              label: Text('Formulario')),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Divider(),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text(
              'Sesión',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),

          const NavigationDrawerDestination(
            icon: Icon(Icons.person),
            label: Text('Perfil'),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // ⭐ APPBAR CON MENÚ
      appBar: AppBar(
        title: const Text('FIX IT!!'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),

      // ⭐ DRAWER
      drawer: _buildDrawer(context),

      // ⭐ TU CONTENIDO AQUÍ
      body: widget.contenido,
    );
  }
}
