import 'package:flutter/material.dart';

class BotonesPage extends StatefulWidget {
  @override
  _BotonesPageState createState() => _BotonesPageState();
}

class _BotonesPageState extends State<BotonesPage> {
  int _selectedIndex = 0;

  // Lista de pantallas que se mostrarán al hacer clic
  final List<Widget> _pages = [
    Center(child: Text('Mi App', style: TextStyle(fontSize: 24))),
    Center(child: Text('Pedidos', style: TextStyle(fontSize: 24))),
    Center(child: Text('Solicitudes', style: TextStyle(fontSize: 24))),
    Center(child: Text('Alertas', style: TextStyle(fontSize: 24))),
    Center(child: Text('Perfil', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFDAC1), // Color pastel durazno
        selectedItemColor: Color.fromARGB(255, 174, 112, 227), // Lila suave
        unselectedItemColor: Colors.black45,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Solicitudes',
          ),   
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alertas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
