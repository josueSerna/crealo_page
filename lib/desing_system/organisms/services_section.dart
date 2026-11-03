import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/data/services.dart';
import 'package:page_crealo/desing_system/pages/service_page.dart';

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
                  for (final service in services)
                    ServiceCard(
                      title: service.name,
                      description: service.description,
                      icon: _iconForService(service.id),
                      buttonLabel: 'Conocer servicio',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => ServicePage(service: service),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconForService(String id) {
    return switch (id) {
      'redes-sociales' => Icons.palette_outlined,
      'estrategia-de-marca' => Icons.campaign_outlined,
      'produccion-audiovisual' => Icons.movie_creation_outlined,
      'fotografia-marca-producto' => Icons.camera,
      _ => Icons.threesixty,
    };
  }
}
