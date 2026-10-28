import 'package:breakify/breakify.dart';
import 'package:flutter/material.dart';
import 'package:page_crealo/desing_system/tokens/app_theme.dart';
import 'package:page_crealo/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BreakifyScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
