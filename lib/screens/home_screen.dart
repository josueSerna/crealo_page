import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/organisms/services_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakifyDebugBanner(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [ServicesSection()]),
        ),
      ),
    );
  }
}
