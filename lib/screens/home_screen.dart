import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_crealo/desing_system/organisms/about_section.dart';
import 'package:page_crealo/desing_system/organisms/banner_section.dart';
import 'package:page_crealo/desing_system/organisms/footer_section.dart';
import 'package:page_crealo/desing_system/organisms/services_section.dart';
import 'package:page_crealo/desing_system/organisms/videos_section.dart';
import 'package:page_crealo/desing_system/tokens/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bannerKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _videosKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BreakifyNavbar(
        logo: SvgPicture.asset('assets/images/logos/logo_min.svg', height: 80),
        items: [
          BreakifyNavbarItem(
            label: 'Inicio',
            onTap: () => _scrollTo(_bannerKey),
          ),
          BreakifyNavbarItem(
            label: 'Sobre Nosotros',
            onTap: () => _scrollTo(_aboutKey),
          ),
          BreakifyNavbarItem(
            label: 'Servicios',
            onTap: () => _scrollTo(_servicesKey),
          ),
          BreakifyNavbarItem(
            label: 'Videos',
            onTap: () => _scrollTo(_videosKey),
          ),
        ],
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.backgroundDark,
        menuBackgroundColor: AppColors.backgroundLight,
        scrollBehavior: BreakifyNavbarScrollBehavior.hideOnScroll,
        body: SingleChildScrollView(
          child: Column(
            children: [
              BannerSection(
                key: _bannerKey,
                onExplorePortfolio: () => _scrollTo(_aboutKey),
                onViewServices: () => _scrollTo(_servicesKey),
              ),
              AboutSection(key: _aboutKey),
              ServicesSection(key: _servicesKey),
              VideosSection(key: _videosKey),
              FooterSection(
                links: [
                  FooterLink(
                    label: 'Inicio',
                    onTap: () => _scrollTo(_bannerKey),
                  ),
                  FooterLink(
                    label: 'Sobre Nosotros',
                    onTap: () => _scrollTo(_aboutKey),
                  ),
                  FooterLink(
                    label: 'Servicios',
                    onTap: () => _scrollTo(_servicesKey),
                  ),
                  FooterLink(
                    label: 'Videos',
                    onTap: () => _scrollTo(_videosKey),
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
