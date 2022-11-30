import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_app/src/app.dart';
import 'package:starwars_app/src/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      Provider<ThemeProvider>(
        create: (_) => ThemeProvider(),
        dispose: (context, ThemeProvider provider) => provider.dispose(),
      ),
    ],
    
    child: const App(),
  ));
}
