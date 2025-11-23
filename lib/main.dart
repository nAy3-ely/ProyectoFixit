import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 🔥 Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Tema
import 'theme_provider.dart';

// Pantallas
import 'screens/bienvenida.dart';
import 'screens/login.dart';
import 'screens/registro.dart';
import 'screens/descripcion.dart';
import 'screens/perfil_page.dart';
import 'screens/botones.dart';
import 'screens/categorias.dart';
import 'screens/buscar.dart';
import 'screens/solicitudes.dart';
import 'screens/formulario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Inicializar Firebase ANTES del runApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/perfil_page': (context) => PerfilPage(),
        '/botones': (context) => BotonesPage(),
        '/categorias': (context) => CategoriasPage(),
        '/buscar': (context) => BuscarPage(),
        '/solicitudes': (context) => SolicitudesPage(),
        '/formulario': (context) => FormularioPage(),
      },
    );
  }
}