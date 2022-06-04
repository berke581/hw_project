import 'package:flutter/material.dart';
import 'package:hw_project/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          home: const HomePage(),
          color: const Color(0xFF212936),
          themeMode: themeProvider.themeMode,
          theme: Themes.darkTheme,
          darkTheme: Themes.lightTheme,
        );
      });
}
