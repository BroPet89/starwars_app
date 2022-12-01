import 'package:flutter/material.dart';
import 'package:starwars_app/src/ui/star_wars_app_theme.dart';
import 'package:rxdart/rxdart.dart';

class ThemeProvider {
  late BehaviorSubject<ThemeData> currentTheme;
  late BehaviorSubject<ThemeData> candidateTheme;
  final starWarsAppTheme = StarWarsAppTheme.light();


  ThemeProvider() {
    candidateTheme = BehaviorSubject<ThemeData>.seeded(starWarsAppTheme);
    currentTheme = BehaviorSubject<ThemeData>.seeded(starWarsAppTheme);
  }

  setCandidateTheme({required Map<String, dynamic> data}) {
  }

  void dispose() {
    candidateTheme.close();
    currentTheme.close();
  }
}