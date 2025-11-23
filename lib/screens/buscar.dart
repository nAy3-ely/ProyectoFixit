import 'package:flutter/material.dart';
import './pantalla_base.dart';
import '../models/servicio.dart';
import 'detalle.dart';

class BuscarPage extends StatefulWidget {
  @override
  _BuscarPageState createState() => _BuscarPageState();
}

class _BuscarPageState extends State<BuscarPage> {
  String consulta = '';
  String categoriaSeleccionada = '';

  final List<Servicio> servicios = [
    // PLOMERIA
    Servicio(
    nombre: 'Jose Roberto',
    categoria: 'Plomería',
    imagen: 'assets/images/plomeria.jpg',
    descripcion: 'Plomero profesional con más de 10 años de experiencia en reparación e instalación de tuberías, grifos y sanitarios. Especialista en detección y solución de fugas de agua. Servicio rápido y garantizado.',
    habilidades: ['Reparaciones duraderas', 'Precios justos', 'Servicio de emergencia 24/7'],
),
    Servicio(
    nombre: 'Ana María Vargas',
    categoria: 'Plomería',
    imagen: 'assets/images/plomeria.jpg',
    descripcion: 'Maestra plomera con 8 años de experiencia. *Especialista en detección de fugas no visibles* utilizando equipos de geófono y gas trazador. Ofrezco diagnósticos precisos para resolver problemas de humedad y alta factura de agua sin necesidad de romper innecesariamente.',
    habilidades: ['Detección sin daños', 'Garantía por escrito', 'Ahorro en factura de agua'],
),
    Servicio(
    nombre: 'Carlos Manuel Díaz',
    categoria: 'Plomería',
    imagen: 'assets/images/plomeria.jpg',
    descripcion: 'Técnico certificado con 15 años en el sector, enfocado en *instalaciones hidráulicas y de gas* para obras nuevas y remodelaciones. Experto en calentadores, bombas de agua, sistemas hidroneumáticos y mantenimiento preventivo integral.',
    habilidades: ['Trabajos de gran envergadura', 'Certificación en Gas Natural', 'Mantenimiento preventivo'],
),

    // Electricidad
    Servicio(
    nombre: 'Ricardo Antonio López',
    categoria: 'Electricidad',
    imagen: 'assets/images/electricidad.jpg',
    descripcion: 'Electricista certificado con 7 años de experiencia en instalaciones y reparaciones domésticas. Especialista en cortocircuitos, fallas de interruptores, tomas de corriente y cableado de iluminación interior. *Servicio de urgencia 24 horas.*',
    habilidades: ['Atención inmediata a fallas', 'Instalaciones seguras y normadas', 'Presupuestos detallados sin compromiso'],
),
    Servicio(
    nombre: 'Sofía Jiménez Cruz',
    categoria: 'Electricidad',
    imagen: 'assets/images/electricidad.jpg',
    descripcion: 'Técnica electricista con enfoque en la eficiencia energética para locales y oficinas. Experta en diseño e instalación de *sistemas de iluminación LED*, tableros de control y subestaciones de baja tensión. Te ayudo a reducir tu consumo eléctrico.',
    habilidades: ['Optimización de consumo eléctrico', 'Cálculo de cargas y balanceo', 'Experta en normatividad (NOM)'],
),

    // Carpintería
    Servicio(
    nombre: 'Daniela Reyes',
    categoria: 'Carpintería',
    imagen: 'assets/images/carpinteria.jpg',
    descripcion: 'Ebanista con 10 años de experiencia, especializada en la *creación y restauración de mobiliario fino*. Diseño y fabricación de cocinas, armarios empotrados, bibliotecas y piezas únicas utilizando maderas nobles (nogal, cerezo, ébano) y técnicas de ensamblaje tradicional.',
    habilidades: ['Diseños 3D de piezas a medida', 'Acabados de laca y barniz de alta calidad', 'Restauración de muebles antiguos'],
),
    Servicio(
    nombre: 'Marco Polo Galván',
    categoria: 'Carpintería',
    imagen: 'assets/images/carpinteria.jpg',
    descripcion: 'Carpintero de obra con 15 años en construcción y remodelación. Experto en la *instalación de puertas, ventanas, marcos y pisos de madera (parquet y laminados)*. También realizo trabajos exteriores como pérgolas, decks y estructuras de madera para tejados.',
    habilidades: ['Instalación rápida de puertas y pisos', 'Trabajos estructurales exteriores (decks/pérgolas)', 'Manejo de materiales compuestos (melamina, MDF)'],
),

    // ASISTENCIA
    Servicio(
      nombre: 'Elena Mendoza',
    categoria: 'Asistencia Doméstica',
    imagen: 'assets/images/domestica.jpg',
    descripcion: 'Profesional con 9 años dedicada a la *limpieza profunda y desinfección* de hogares. Experta en el manejo de productos ecológicos y la optimización de rutinas de limpieza. Me enfoco en cocinas, baños y el tratamiento de superficies delicadas para un ambiente saludable.',
    habilidades: ['Limpieza ecológica y sostenible', 'Eficacia en tratamiento de manchas', 'Organización básica de armarios y espacios'],
),


    // CERRAJERIA
    Servicio(
    nombre: 'Héctor Gómez',
    categoria: 'Cerrajería',
    imagen: 'assets/images/cerrajeria.jpg',
    descripcion: 'Cerrajero profesional con servicio de *emergencia 24 horas*. Apertura de puertas de hogar y negocio sin daños, cambio de bombines y cilindros, e instalación de cerrojos de seguridad. Llego a tu ubicación en menos de 30 minutos en la zona metropolitana.',
    habilidades: ['Atención 24/7 (incluye festivos)', 'Aperturas sin dañar la puerta', 'Duplicado de llaves estándar in situ'],
),


    // Jardinería

    Servicio(
    nombre: 'Gerardo Montes',
    categoria: 'Jardinería',
    imagen: 'assets/images/jardineria.jpg',
    descripcion: 'Jardinero profesional enfocado en el *mantenimiento preventivo y curativo*. Especializado en el cuidado intensivo de césped (siega, aireación, fertilización), poda de formación y control de plagas y enfermedades. Ideal para comunidades y propiedades que requieren perfección diaria.',
    habilidades: ['Mantenimiento programado (semanal/quincenal)', 'Control biológico de plagas', 'Poda especializada de frutales y arbustos'],
),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is String) {
      categoriaSeleccionada = args;
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultados = servicios
        .where((a) =>
            (categoriaSeleccionada.isEmpty || a.categoria == categoriaSeleccionada) &&
            a.nombre.toLowerCase().contains(consulta.toLowerCase()))
        .toList();

    return PantallaBase(
      currentIndex: 3,
      contenido: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: categoriaSeleccionada.isEmpty
                    ? 'Buscar'
                    : 'Buscar en $categoriaSeleccionada...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  consulta = value;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: resultados.isEmpty
                  ? Text(
                      'No se encuentra en ${categoriaSeleccionada.isEmpty ? "la búsqueda" : categoriaSeleccionada}',
                      style: TextStyle(fontSize: 16),
                    )
                  : ListView.builder(
                      itemCount: resultados.length,
                      itemBuilder: (context, index) {
                        final a = resultados[index];
                        return Card(
                          child: ListTile(
                            leading: Image.asset(
                              a.imagen,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(a.nombre),
                            subtitle: Text(a.categoria),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetallePage(servicio: a),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
