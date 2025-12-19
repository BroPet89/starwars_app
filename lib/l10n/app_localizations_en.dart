// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Star Wars app';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get important => 'Important';

  @override
  String get skip => 'Skip';

  @override
  String get areYouSureYouWishToSignOut => 'Are you sure you want to sign out?';

  @override
  String get unableToSignOut => 'Unable to sign out';
}
