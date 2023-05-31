import 'package:flutter/material.dart';
import 'package:windgets_app/config/theme/app_theme.dart';
import 'package:windgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:windgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:windgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons': (context) => const ButtonsSreen(),
        '/cards': (context) => const CardsScreen(),
      },
    );
  }
}
