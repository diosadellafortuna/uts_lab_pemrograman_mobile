import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const KuisApp(),
    ),
  );
}

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  ThemeData _buildTheme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins', // font kustom dari assets/fonts
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: brightness,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeProvider>().mode;

    return MaterialApp(
      title: 'Kuis Flutter',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: themeMode,
      home: const HomeScreen(),
    );
  }
}
