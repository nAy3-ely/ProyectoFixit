import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pantalla_base.dart';

class RegistroPage extends StatefulWidget {
  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final nombre = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final pass2 = TextEditingController();

  bool cargando = false;

  @override
  Widget build(BuildContext context) {
    return PantallaBase(
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
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                width: 350,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Crea una cuenta',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      _campoTexto('Nombre', controller: nombre),
                      SizedBox(height: 12),
                      _campoTexto('Email', controller: email),
                      SizedBox(height: 12),
                      _campoTexto('Contraseña', controller: pass, oculto: true),
                      SizedBox(height: 12),
                      _campoTexto('Confirmar contraseña', controller: pass2, oculto: true),

                      SizedBox(height: 20),

                      cargando
                          ? CircularProgressIndicator(color: Colors.white)
                          : ElevatedButton(
                              onPressed: registrarUsuario,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 224, 133, 7),
                                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text('Registro', style: TextStyle(color: Colors.white)),
                            ),

                      SizedBox(height: 20),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "¿Ya tienes una cuenta? Inicia sesión",
                          style: TextStyle(
                            color: Colors.white70,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registrarUsuario() async {
    if (pass.text.trim() != pass2.text.trim()) {
      _alerta("Las contraseñas no coinciden");
      return;
    }

    setState(() => cargando = true);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: pass.text.trim(),
      );

      String uid = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "nombre": nombre.text.trim(),
        "email": email.text.trim(),
        "uid": uid,
        "fecha_registro": DateTime.now(),
      });

      _alerta("Usuario registrado correctamente ❤️");

      Navigator.pushReplacementNamed(context, '/login');

    } catch (e) {
      _alerta("Error: $e");
    } finally {
      setState(() => cargando = false);
    }
  }

  void _alerta(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  Widget _campoTexto(String texto, {bool oculto = false, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      obscureText: oculto,
      decoration: InputDecoration(
        hintText: texto,
        hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(211, 243, 193, 84)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}