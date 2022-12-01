import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_app/src/providers/theme_provider.dart';
import 'package:starwars_app/src/style/responsive.dart';
import 'package:starwars_app/src/style/text_theme.dart';
import 'package:starwars_app/src/utils/extensions/custom_colors.dart';
import 'package:starwars_app/src/utils/localization.dart';
import 'package:starwars_app/src/utils/my_custom_scroll_behaviour.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_wrapper.dart';


class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return StreamBuilder<ThemeData>(
          stream: themeProvider.currentTheme,
          builder: (context, currentTheme) {
            if(!currentTheme.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

          return MaterialApp.router(
            scrollBehavior: MyCustomScrollBehaviour(),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: currentTheme.data!,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateTitle: (context) => Trans.of(context).appName,
            title: "Star Wars App",
            routeInformationParser: BeamerParser(),
            builder: (context, child) {
              return ResponsiveWrapper.builder(
                SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: DefaultTextStyle(
                      style: TextStyles.body.colour(Theme.of(context).employerCustomColors(context).text),
                      child: child!
                    )
                  ),
                ),
                defaultScale: true,
                minWidth: 300,
                breakpoints: breakpoints
              );
            }
          );
        });
      }
    );  
  }
}