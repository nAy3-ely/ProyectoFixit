import 'dart:ui';
import 'package:flutter/material.dart';
import 'pantalla_base.dart';
import '../screens/user_session.dart'; // <-- IMPORTANTE

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Log into your account',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    // EMAIL
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Username/Email',
                        hintStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),

                    SizedBox(height: 16),

                    // PASSWORD
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70),
                        suffixText: 'Forgot?',
                        suffixStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),

                    SizedBox(height: 20),

                    // LOGIN BUTTON
                    ElevatedButton(
                      onPressed: () {
                        // Aquí pones los datos con los que quieres iniciar sesión
                        UserSession.login(
                          "Nayhely Valle",
                          emailController.text.trim().isEmpty
                              ? "ngt.valle@yavirac.edu.ec"
                              : emailController.text.trim(),
                        );

                        Navigator.pushReplacementNamed(context, '/categorias');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 224, 133, 7),
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Log In', style: TextStyle(color: Colors.white)),
                    ),

                    SizedBox(height: 12),

                    SizedBox(height: 24),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registro');
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
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
    );
  }
}
