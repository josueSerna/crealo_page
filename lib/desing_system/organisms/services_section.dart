import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';

import '../atoms/app_section_title.dart';
import '../molecules/service_card.dart';
import '../tokens/app_colors.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakifySection(
      fullViewport: true,
      backgroundColor: AppColors.backgroundLight,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: BreakifyContainer(
          maxWidth: const BreakifyValue(sm: 1200.0),
          padding: const BreakifyValue(
            sm: EdgeInsets.symmetric(horizontal: 10, vertical: 56),
            lg: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppSectionTitle(
                title: 'Nuestros servicios',
                subtitle:
                    'Soluciones creativas para conectar tu marca con las personas.',
                titleColor: AppColors.primary,
                subtitleColor: AppColors.textSecondary,
              ),
              const SizedBox(height: 40),
              BreakifyGrid(
                columns: const BreakifyValue(sm: 1, md: 2, lg: 3),
                spacing: BreakifyFluidValue(sm: 5),
                heightMode: BreakifyHeightMode.equal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ServiceCard(
                    title: 'Gestión de redes sociales',
                    description:
                        'Creamos una presencia digital con intención, desde estrategia hasta contenido y planificación para tus redes.',
                    icon: Icons.palette_outlined,
                    buttonLabel: 'Ver planes',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Estrategia de marca',
                    description:
                        'Definimos tu marca, público, personalidad y comunicación para conectar con claridad y coherencia.',
                    icon: Icons.campaign_outlined,
                    buttonLabel: 'Construir mi marca',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Producción audiovisual',
                    description:
                        'Convertimos ideas en piezas audiovisuales para marcas, campañas y lanzamientos desde el concepto hasta la edición.',
                    icon: Icons.movie_creation_outlined,
                    buttonLabel: 'Crear mi contenido',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Fotografía de marca y producto',
                    description:
                        'Fotografiamos tu marca y tus productos para destacar en redes, catálogos y campañas.',
                    icon: Icons.camera,
                    buttonLabel: 'Ver servicio fotográfico',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Capacitaciones — Créalo 360',
                    description:
                        'Aprende a manejar Instagram con estrategia, contenido y orden para comunicar mejor tu marca.',
                    icon: Icons.threesixty,
                    buttonLabel: 'Conocer capacitaciones',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
