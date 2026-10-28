import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/widgets/full_viewport_section.dart';

import '../atoms/app_section_title.dart';
import '../molecules/service_card.dart';
import '../tokens/app_colors.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FullViewportSection(
      child: Container(
        width: double.infinity,
        color: AppColors.backgroundDark,
        child: BreakifyContainer(
          maxWidth: const BreakifyValue(sm: 1200.0),
          padding: const BreakifyValue(
            sm: EdgeInsets.symmetric(horizontal: 20, vertical: 56),
            lg: EdgeInsets.symmetric(horizontal: 32, vertical: 80),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppSectionTitle(
                title: 'Nuestros servicios',
                subtitle:
                    'Soluciones creativas para conectar tu marca con las personas.',
                titleColor: AppColors.white,
                subtitleColor: AppColors.textSecondary,
              ),
              const SizedBox(height: 40),
              BreakifyGrid(
                columns: BreakifyValue(sm: 1, md: 2, lg: 3),
                spacing: const BreakifyValue(sm: 20.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                equalHeight: true,
                children: [
                  ServiceCard(
                    title: 'Gestión de redes sociales',
                    description:
                        'Construimos una presencia digital con intención, desde la estrategia y la creación de contenido hasta la planificación de tus redes.',
                    icon: Icons.palette_outlined,
                    buttonLabel: 'Ver planes',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Estrategia de marca',
                    description:
                        'Definimos la dirección de tu marca, su público, personalidad y comunicación para que dejes de improvisar y empieces a conectar.',
                    icon: Icons.campaign_outlined,
                    buttonLabel: 'Construir mi marca',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Producción audiovisual',
                    description:
                        'Convertimos ideas en piezas audiovisuales para marcas, campañas, productos y lanzamientos, desde el concepto hasta la edición final.',
                    icon: Icons.movie_creation_outlined,
                    buttonLabel: 'Crear mi contenido',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Fotografía de marca y producto',
                    description:
                        'Creamos fotografías que reflejan la esencia de tu marca y hacen que tus productos destaquen en redes, catálogos y campañas.',
                    icon: Icons.camera,
                    buttonLabel: 'Ver servicio fotográfico',
                    onPressed: () {},
                  ),
                  ServiceCard(
                    title: 'Capacitaciones — Créalo 360',
                    description:
                        'Aprende a gestionar Instagram estratégicamente: crea contenido, organiza tu feed y alinea a tu equipo para comunicar mejor.',
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
