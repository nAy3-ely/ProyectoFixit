import 'dart:ui';
import 'package:flutter/material.dart';

// Definición de las áreas disponibles para la postulación
const List<String> areasDeTrabajo = <String>[
  'Plomería', 
  'Carpintería', 
  'Electricidad', 
  'Albañilería',
  'Otro'
];

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();

  // Controladores con datos QUEMADOS
  final TextEditingController _nombresController =
      TextEditingController(text: "Juan Carlos");
  final TextEditingController _apellidosController =
      TextEditingController(text: "Mendoza López");
  final TextEditingController _emailController =
      TextEditingController(text: "juan.mendoza@example.com");
  final TextEditingController _telefonoController =
      TextEditingController(text: "0991234567");
  final TextEditingController _experienciaController =
      TextEditingController(text: "4");
  final TextEditingController _habilidadesController =
      TextEditingController(text: "Responsable, puntual, trabajo en altura");
  final TextEditingController _direccionController =
      TextEditingController(text: "Av. América y Cristóbal Colón, Quito");

  // Variables con valores quemados
  String? _areaSeleccionada = "Electricidad";
  DateTime? _fechaNacimiento = DateTime(1999, 7, 14);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        _fechaNacimiento = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _areaSeleccionada != null &&
        _fechaNacimiento != null) {
      
      // Construir mapa de datos quemados
      Map<String, dynamic> datosPostulante = {
        'Nombres': _nombresController.text,
        'Apellidos': _apellidosController.text,
        'FechaNacimiento': _fechaNacimiento.toString().split(' ')[0],
        'Correo': _emailController.text,
        'Telefono': _telefonoController.text,
        'Area': _areaSeleccionada,
        'Experiencia (años)': _experienciaController.text,
        'Habilidades': _habilidadesController.text,
        'Direccion': _direccionController.text,
      };

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Postulación Enviada')),
      );

      print('--- DATOS  ENVIADOS ---');
      datosPostulante.forEach((key, value) {
        print('$key: $value');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Postulación'),
        backgroundColor: const Color.fromARGB(255, 196, 168, 113),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Datos Personales y de Contacto',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const Divider(height: 30, thickness: 1),

              _buildTextFormField(
                controller: _nombresController,
                label: 'Nombres Completos',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),

              _buildTextFormField(
                controller: _apellidosController,
                label: 'Apellidos Completos',
                icon: Icons.person_add_alt_1,
              ),
              const SizedBox(height: 20),

              _buildDateSelector(context),
              const SizedBox(height: 20),

              _buildTextFormField(
                controller: _emailController,
                label: 'Correo Electrónico',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),

              _buildTextFormField(
                controller: _telefonoController,
                label: 'Número de Teléfono',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                maxLength: 15,
              ),
              const SizedBox(height: 30),

              const Text(
                'Detalles de Postulación',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const Divider(height: 30, thickness: 1),

              _buildAreaDropdown(),
              const SizedBox(height: 20),

              _buildTextFormField(
                controller: _experienciaController,
                label: 'Años de Experiencia',
                icon: Icons.work_outline,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              _buildTextFormField(
                controller: _habilidadesController,
                label: 'Capacidades y Habilidades',
                icon: Icons.military_tech_outlined,
                maxLines: 3,
              ),
              const SizedBox(height: 20),

              _buildTextFormField(
                controller: _direccionController,
                label: 'Dirección Completa',
                icon: Icons.location_on_outlined,
                maxLines: 2,
              ),
              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.send),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Enviar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 173, 143, 112),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helpers ---
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    int? maxLength,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 205, 160, 128)),
        counterText: '',
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) return 'Campo obligatorio';
            return null;
          },
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Fecha de Nacimiento',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
        ),
        child: Text(
          _fechaNacimiento!.toString().split(' ')[0],
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildAreaDropdown() {
    return DropdownButtonFormField<String>(
      value: _areaSeleccionada,
      decoration: const InputDecoration(
        labelText: 'Área a Postular',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.construction, color: Color.fromARGB(255, 200, 161, 95)),
      ),
      items: areasDeTrabajo
          .map((value) => DropdownMenuItem(value: value, child: Text(value)))
          .toList(),
      onChanged: (value) {
        setState(() {
          _areaSeleccionada = value;
        });
      },
    );
  }
}
