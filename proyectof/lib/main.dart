import 'package:deber/screens/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

import 'screens/bienvenida.dart';
import 'screens/login.dart';
import 'screens/registro.dart';
import 'screens/descripcion.dart';
import 'screens/opciones.dart';
import 'screens/botones.dart';
import 'screens/categorias.dart';
import 'screens/buscar.dart';
import 'screens/favoritos.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FIXIT',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BienvenidaPage(),
        '/login': (context) => LoginPage(),
        '/registro': (context) => RegistroPage(),
        '/descripcion': (context) => DescripcionPage(),
        '/opciones': (context) => OpcionesPage(),
        '/botones': (context) => BotonesPage(),
        '/categorias': (context) => CategoriasPage(),
        '/buscar': (context) => BuscarPage(),
        '/favoritos': (context) => FavoritosPage(),
        '/formulario': (context) => FormularioPage(),
      },
    );
  }
}
