import 'package:flutter/material.dart';
import 'package:frontend/screens/homeScreen.dart';
import 'package:frontend/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const s1 = Color(0xFFF4A261);
    const s2 = Color(0xFFF6E7D8);
    const s3 = Color(0xFF9C6644);
    const s4 = Color(0xFF3D2C23);
    const s5 = Color(0xFFFFFFFF);
    const s6 = Color(0xFF000000);

    const ColorScheme scheme = ColorScheme(
      brightness: Brightness.light,
      primary: s1,
      onPrimary: s6,
      secondary: s3,
      onSecondary: s5,
      error: Colors.red,
      onError: Colors.white,
      surface: s2,
      onSurface: s6,
      surfaceContainerHighest: s4,
      onSurfaceVariant: s5,
    );

    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,

      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surfaceContainerHighest, // S4
        foregroundColor: scheme.onSurfaceVariant,        // S5
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,   // S1
          foregroundColor: scheme.onPrimary, // S6
        ),
      ),

      cardTheme: CardTheme(
        color: scheme.surface, // S2
      ),
    );

    return MaterialApp(
      title: 'Mmmhlicious - The only app you will ever need in your cooking life+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: scheme,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
