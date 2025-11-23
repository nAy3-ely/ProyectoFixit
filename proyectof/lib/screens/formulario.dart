import 'dart:ui';
import 'package:flutter/material.dart';
import 'formulario.dart';



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
  // Clave para el formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _experienciaController = TextEditingController();
  final TextEditingController _habilidadesController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();

  // Variables para campos especiales
  String? _areaSeleccionada;
  DateTime? _fechaNacimiento;

  // Función para abrir el selector de fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _fechaNacimiento ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // No se puede nacer en el futuro
      locale: const Locale('es', 'ES'), // Establecer el idioma a español
    );
    if (picked != null && picked != _fechaNacimiento) {
      setState(() {
        _fechaNacimiento = picked;
      });
    }
  }

  // Función para procesar y mostrar los datos
  void _submitForm() {
    if (_formKey.currentState!.validate() && _areaSeleccionada != null && _fechaNacimiento != null) {
      
      // Construir el objeto de datos para ver en consola
      Map<String, dynamic> datosPostulante = {
        'Nombres': _nombresController.text,
        'Apellidos': _apellidosController.text,
        'FechaNacimiento': _fechaNacimiento.toString().split(' ')[0], // Solo la fecha
        'Correo': _emailController.text,
        'Telefono': _telefonoController.text,
        'Area': _areaSeleccionada,
        'Experiencia (años)': _experienciaController.text,
        'Habilidades': _habilidadesController.text,
        'Direccion': _direccionController.text,
      };

      // Muestra un SnackBar de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Postulación Enviada con Éxito!')),
      );

      // Imprime los datos en la consola (Lógica de tu proyecto: API/DB va aquí)
      print('--- DATOS DE POSTULACIÓN ENVIADOS ---');
      datosPostulante.forEach((key, value) {
        print('$key: $value');
      });

    } else if (_areaSeleccionada == null) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona un área a postular.')),
      );
    } else if (_fechaNacimiento == null) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona tu fecha de nacimiento.')),
      );
    }
  }

  @override
  void dispose() {
    // Limpiar los controladores
    _nombresController.dispose();
    _apellidosController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _experienciaController.dispose();
    _habilidadesController.dispose();
    _direccionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Postulación'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Título descriptivo
              const Text(
                'Datos Personales y de Contacto',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const Divider(height: 30, thickness: 1),

              // --- Nombres Completos ---
              _buildTextFormField(
                controller: _nombresController,
                label: 'Nombres Completos',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),

              // --- Apellidos Completos ---
              _buildTextFormField(
                controller: _apellidosController,
                label: 'Apellidos Completos',
                icon: Icons.person_add_alt_1,
              ),
              const SizedBox(height: 20),

              // --- Fecha de Nacimiento (Picker) ---
              _buildDateSelector(context),
              const SizedBox(height: 20),

              // --- Correo Electrónico ---
              _buildTextFormField(
                controller: _emailController,
                label: 'Correo Electrónico',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El correo es obligatorio.';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Introduce un correo válido.';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // --- Teléfono ---
              _buildTextFormField(
                controller: _telefonoController,
                label: 'Número de Teléfono',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                maxLength: 15,
              ),
              const SizedBox(height: 30),

              // Título descriptivo para la postulación
              const Text(
                'Detalles de Postulación',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const Divider(height: 30, thickness: 1),

              // --- Área a Postular (SELECT) ---
              _buildAreaDropdown(),
              const SizedBox(height: 20),

              // --- Años de Experiencia ---
              _buildTextFormField(
                controller: _experienciaController,
                label: 'Años de Experiencia',
                icon: Icons.work_outline,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Los años de experiencia son requeridos.';
                  if (int.tryParse(value) == null) return 'Debe ser un número válido.';
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // --- Capacidades y Habilidades (Área de texto grande) ---
              _buildTextFormField(
                controller: _habilidadesController,
                label: 'Capacidades y Habilidades (Describa brevemente)',
                icon: Icons.military_tech_outlined,
                maxLines: 3,
                minLines: 2,
              ),
              const SizedBox(height: 20),

              // --- Dirección ---
              _buildTextFormField(
                controller: _direccionController,
                label: 'Dirección Completa',
                icon: Icons.location_on_outlined,
                maxLines: 2,
              ),
              const SizedBox(height: 40),

              // --- Botón de Envío ---
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.send),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Enviar Postulación',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // --- Widgets de Ayuda ---

  // Widget genérico para campos de texto
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    int maxLines = 1,
    int? minLines,
    int? maxLength,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        counterText: '', // Oculta el contador de maxLength
      ),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio.';
        }
        return null;
      },
    );
  }

  // Widget para el selector de fecha
  Widget _buildDateSelector(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Fecha de Nacimiento',
          border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.blueAccent),
          errorText: (_fechaNacimiento == null && _formKey.currentState?.validate() == true) 
                     ? 'Selecciona tu fecha de nacimiento.' : null,
        ),
        child: Text(
          _fechaNacimiento == null
              ? 'Seleccionar Fecha'
              : _fechaNacimiento!.toString().split(' ')[0], // Muestra solo la parte de la fecha
          style: TextStyle(
            fontSize: 16,
            color: _fechaNacimiento == null ? Colors.grey : Colors.black,
          ),
        ),
      ),
    );
  }

  // Widget para el Dropdown (Select) de Área
  Widget _buildAreaDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Área a Postular',
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        prefixIcon: Icon(Icons.construction, color: Colors.blueAccent),
      ),
      value: _areaSeleccionada,
      hint: const Text('Selecciona una opción'),
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      style: const TextStyle(fontSize: 16, color: Colors.black),
      onChanged: (String? newValue) {
        setState(() {
          _areaSeleccionada = newValue;
        });
      },
      validator: (String? value) {
        if (value == null) {
          return 'Debes seleccionar un área.';
        }
        return null;
      },
      items: areasDeTrabajo.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}