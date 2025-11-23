import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pantalla_base.dart';
import '../theme_provider.dart';

class OpcionesPage extends StatefulWidget {
  @override
  _OpcionesPageState createState() => _OpcionesPageState();
}

class _OpcionesPageState extends State<OpcionesPage> {
  bool notificaciones = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return PantallaBase(
      currentIndex: 4,
      contenido: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo_login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 340,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Opciones de Usuario',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    SwitchListTile(
                      title: Text('Notificaciones', style: TextStyle(color: Colors.white)),
                      value: notificaciones,
                      onChanged: (value) {
                        setState(() {
                          notificaciones = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: Text('Modo oscuro', style: TextStyle(color: Colors.white)),
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme(value);
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Volver al inicio', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
