import 'dart:ui';
import 'package:flutter/material.dart';
import 'pantalla_base.dart';

class DescripcionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PantallaBase(
      contenido: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fondo_descripcion.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGlassBox(
                  title: 'Objetivos General',
                  content: 'Brindar a los usuarios una herramienta educativa y accesible para conocer alimentos saludables, organizados por categorías, y comprender sus beneficios para la salud.',
                ),
                SizedBox(height: 20),
                _buildGlassBox(
                  title: 'Objetivos Específicos',
                  content:
                      'Informar sobre los principales grupos de alimentos saludables: frutas, verduras, granos, proteínas, entre otros.'
                      'Explicar los beneficios nutricionales y funcionales de cada alimento..'
                      'Promover hábitos alimenticios conscientes a través de contenido claro, confiable y visual.'
                      'Facilitar el acceso a esta información desde cualquier dispositivo móvil.'
                      'Incentivar el aprendizaje mediante una navegación simple e interactiva.',
                    
                  imagePath: 'assets/images/usuario.jpg',
                  buttonText: 'Continuar',
                  buttonAction: () {
                    Navigator.pushNamed(context, '/opciones');
                  },
                ),
                SizedBox(height: 20),
                _buildGlassBox(
                  title: 'Alcance de la Aplicación',
                  content: 'Esta aplicación está diseñada para todo tipo de usuarios interesados en mejorar su alimentación. Proporciona una lista clasificada de alimentos con su respectiva descripción, beneficios y recomendaciones de consumo.'
                      'Incluye funcionalidades como:'
                      'Exploración por categorías'
                      'Buscador de alimentos'
                      'Sección de favoritos'
                      'Modo claro/oscuro'
                      'Información para compartir'
                  ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassBox({
    required String title,
    required String content,
    String? imagePath,
    String? buttonText,
    VoidCallback? buttonAction,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: 350,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                content,
                style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.4),
                textAlign: TextAlign.center,
              ),
              if (imagePath != null) ...[
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              if (buttonText != null && buttonAction != null) ...[
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: buttonAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(buttonText, style: TextStyle(color: Colors.white)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
