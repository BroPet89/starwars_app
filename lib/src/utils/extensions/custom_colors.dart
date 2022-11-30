import 'package:flutter/material.dart';

class CustomColors {
  final Color text;
  final Color textLight;
  final Color affirmative;
  final Color negative;
  final Color neutral;
  final Color white;
  final Color mainCTA;
  final Color logoBackground;
  final Color contentBackground;
  final Color disabledColor;
  final Color settingsTabBackground;
  final Color settingsSaveButtonBackground;
  final Color settingsDropZoneBorder;
  final Color settingsFormBorder;
  final Color settingsTextFieldText;
  final Color removeColleagueButton;
  final Color sidebarBackground;
  final Color sidebarUnfocused;
  final Color sidebarFocused;
  final Color searchbarBorder;
  final Color tableSortArrow;
  final Color tableSortArrowFaded;
  final Color border;
  final Color jobStatsCard;
  final Color progressBarIndicator;
  final Color progressBarItem;
  final Color progressBarCurrentItem;
  final Color cvSelectorAddon;
  final Color inputBorder;
  final Color translucentBackground;
  final Color whiteBackground;
  final Color radioBackground;
  final Color screeningQuestionBorder;
  final Color candidateJourneyCustomisationSelectedPage;
  final Color hover;
  final Color uploadProgress;


  CustomColors({
    this.text = const Color(0xFFEEEEEE),
    this.textLight = const Color(0xFFEEEEEE),
    this.affirmative = const Color(0xFFEEEEEE),
    this.negative = const Color(0xFFEEEEEE),
    this.neutral = const Color(0xFFEEEEEE),
    this.white = const Color(0xFFEEEEEE),
    this.mainCTA = const Color(0xFFEEEEEE),
    this.logoBackground = const Color(0xFFEEEEEE),
    this.contentBackground = const Color(0xFFEEEEEE),
    this.disabledColor = const Color(0xFFEEEEEE),
    this.settingsTabBackground = const Color(0xFFEEEEEE),
    this.settingsSaveButtonBackground = const Color(0xFFEEEEEE),
    this.settingsDropZoneBorder = const Color(0xFFEEEEEE),
    this.settingsFormBorder = const Color(0xFFEEEEEE),
    this.settingsTextFieldText = const Color(0xFFEEEEEE),
    this.removeColleagueButton = const Color(0xFFEEEEEE),
    this.sidebarBackground = const Color(0xFFEEEEEE),
    this.sidebarUnfocused = const Color(0xFFEEEEEE),
    this.sidebarFocused = const Color(0xFFEEEEEE),
    this.searchbarBorder = const Color(0xFFEEEEEE),
    this.tableSortArrow = const Color(0xFFEEEEEE),
    this.tableSortArrowFaded = const Color(0xFFEEEEEE),
    this.border = const Color(0xFFEEEEEE),
    this.jobStatsCard = const Color(0xFFEEEEEE),
    this.progressBarIndicator = const Color(0xFFEEEEEE),
    this.progressBarItem = const Color(0xFFEEEEEE),
    this.progressBarCurrentItem = const Color(0xFFEEEEEE),
    this.cvSelectorAddon = const Color(0xFFEEEEEE),
    this.inputBorder = const Color(0xFFEEEEEE),
    this.translucentBackground = const Color(0x99FFFFFF),
    this.whiteBackground = const Color(0xFFFFFFFF),
    this.radioBackground = const Color(0xFF0A3172),
    this.screeningQuestionBorder = const Color(0xFFC4C4C4),
    this.candidateJourneyCustomisationSelectedPage = const Color(0xFFEEEEEE),
    this.hover = const Color(0xFFEEEEEE),
    this.uploadProgress = const Color(0xFFEEEEEE),
  });
}

extension ThemeDataExtension on ThemeData {
  static CustomColors _candidateCustom = CustomColors();
  static CustomColors _employerCustom = CustomColors();

  void addEmployerCustom(CustomColors custom) {
    _employerCustom = custom;
  }

  void addCandidateCustom(CustomColors custom) {
    _candidateCustom = custom;
  }

  CustomColors get candidateCustom => _candidateCustom;
  CustomColors get employerCustom => _employerCustom;

  CustomColors candidateCustomColors(BuildContext context) => Theme.of(context).candidateCustom;
  CustomColors employerCustomColors(BuildContext context) => Theme.of(context).employerCustom;
}