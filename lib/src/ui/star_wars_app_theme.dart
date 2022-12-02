import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:starwars_app/src/ui/text_theme.dart';
import 'package:starwars_app/src/utils/constants.dart';
import 'package:starwars_app/src/utils/extensions/custom_colors.dart';


extension StarWarsAppColorScheme on ColorScheme {
  Color get text => const Color(0xFF343A40);
  Color get jobStatsCard => const Color(0xFF979797);

  Color get affirmative => const Color(0xFF23CE6B);
  Color get negative => const Color(0xFFFF3374);
  Color get neutral => const Color(0xFF3C91C1);
  Color get white => const Color(0xFFFFFFFF);

  Color get mainCTA => const Color(0xFF00ABBF);

  Color get layoutBackground => const Color(0xFFF0F0F0);
  Color get layoutBackgroundFourtySixOpacity => const Color(0x75F0F0F0);
  Color get logoBackground => const Color(0xFF0A3172);
  Color get candidateSelection => const Color(0x660A3172);
  Color get contentBackground => const Color(0xFFF5F5F5);
  Color get blurShadowColor => const Color(0x3f000000);

  Color get disabled => const Color(0xFF979797);

  Color get settingsTabBackground => const Color(0xFF3F464E);
  Color get settingsSaveButtonBackground => const Color(0xFF00ABBF);
  Color get settingsDropZoneBorder => const Color(0xFF0A3172);
  Color get settingsFormBorder => const Color(0xFFC4C4C4);
  Color get saveAsDefaultButtonColor => const Color(0xFF002F76);
  Color get jobInformationButtonBackground => const Color(0xFF002F76);
  Color get applicationPageTopbar => const Color(0xFF001536);
  Color get scoreOverSeventyFivePercent => const Color(0xFF62CA75);
  Color get scoreOverFiftyPercent => const Color(0xFFFFA200);
  Color get activeInformationToggle => const Color(0xFF004BA1);

  Color get whatsThisButtonColor => const Color(0xFF00ABBF);

  Color get removeColleagueButton => const Color(0xFFEC4975);

  Color get addPremadeQuestionIcon => const Color(0xFF266AB4);
  Color get premadeQuestionSelected => const Color(0xFF008000);

  Color get sidebarBackground => Colors.white;
  Color get sidebarUnfocused => const Color(0xFF979797);
  Color get sidebarFocused => text;

  Color get searchbarBorder => const Color(0xFF979797);

  Color get tableSortArrow => const Color(0xFF979797);
  Color get tableSortArrowFaded => tableSortArrow.withOpacity(0.5);
  Color get border => const Color(0xFFC4C4C4);

  Color get jobCreationStageCurrent => const Color(0xFF3F464E);
  Color get jobCreationStage => const Color(0xFF979797);
  Color get jobCreationProgressBar => const Color(0xFF67DBC0);

  Color get candidateJourneyCustomisationSelectedPage => const Color(0xFF67DBC0);
  Color get feedbackPageBackground => const Color(0xFF001536);
  Color get feedbackPageVacancyTitleText => const Color(0xFFEBC745);
  Color get sendFeedbackButton => const Color(0xFF50B6C2);

  Color get checkboxBorder => const Color(0xFFC4C4C4);
}


class StarWarsAppTheme {
  
  static ThemeData light() {
    final employerCustomColors = CustomColors(
      text: const Color(0xFF343A40),
      textLight: const Color(0xFFC4C4C4),
      affirmative: const Color(0xFF23CE6B),
      negative: const Color(0xFFFF3374),
      neutral: const Color(0xFF3C91C1),
      white: const Color(0xFFFFFFFF), 
      mainCTA: const Color(0xFF00ABBF),
      logoBackground: const Color(0xFF0A3172),
      contentBackground: const Color(0xFFF0F0F0),
      disabledColor: const Color(0xFF979797),
      settingsTabBackground: const Color(0xFF3F464E),
      settingsSaveButtonBackground: const Color(0xFF00ABBF),
      settingsDropZoneBorder: const Color(0xFF0A3172),
      settingsFormBorder: const Color(0xFFC4C4C4),
      settingsTextFieldText: const Color(0xFF3F464E),
      removeColleagueButton: const Color(0xFFEC4975),
      sidebarBackground: Colors.white,
      sidebarUnfocused: const Color(0xFF979797),
      sidebarFocused: const Color(0xFF343A40),
      searchbarBorder: const Color(0xFF979797),
      tableSortArrow: const Color(0xFF979797),
      tableSortArrowFaded: const Color(0x80979797),
      border: const Color(0xFFC4C4C4),
      jobStatsCard: const Color(0xFF979797),
      candidateJourneyCustomisationSelectedPage: const Color(0xFF67DBC0),
    );

    ThemeData starWarsAppFlexTheme = FlexColorScheme.light(
      colors: FlexSchemeColor.from(
        primary: const Color(0xFF003F9D),
        secondary: const Color(0xFFF0C808),
      ),
      onPrimary: const Color(0xFFEEEEEE),
      onError: const Color(0xFFFAFAFA),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
    ).toTheme;

    ThemeData starWarsAppTheme = starWarsAppFlexTheme.copyWith(
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: starWarsAppFlexTheme.colorScheme.primary
      ),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: employerCustomColors.contentBackground
        ),
        labelColor: employerCustomColors.text,
        unselectedLabelColor: employerCustomColors.textLight,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyles.body.bold.colour(employerCustomColors.text),
        unselectedLabelStyle: TextStyles.body.bold.colour(employerCustomColors.text),
      ),

      scaffoldBackgroundColor: starWarsAppFlexTheme.colorScheme.layoutBackground,

      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(starWarsAppFlexTheme.colorScheme.primary),
        trackColor: MaterialStateProperty.resolveWith((states) => states.contains(MaterialState.selected)
          ? starWarsAppFlexTheme.primaryColorLight
          : employerCustomColors.disabledColor),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          borderSide: BorderSide(color: employerCustomColors.settingsFormBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          borderSide: BorderSide(color: employerCustomColors.settingsFormBorder),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: employerCustomColors.disabledColor),
        )
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.borderRadius))),
        )
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.borderRadius)
            )
          ),
          backgroundColor: MaterialStateProperty.all(starWarsAppFlexTheme.colorScheme.secondary),
          textStyle: MaterialStateProperty.all(TextStyles.body.colour(starWarsAppFlexTheme.colorScheme.onPrimary))
        )
      )
    )..addEmployerCustom(employerCustomColors);

    return starWarsAppTheme;
  }
}