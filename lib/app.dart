
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toca do Tamanduá Terapias',
      theme: AppTheme.light(),
      home: const HomePage(),
    );
  }
}
