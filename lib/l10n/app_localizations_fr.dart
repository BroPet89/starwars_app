// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Star Wars app';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get important => 'Important';

  @override
  String get skip => 'Passer';

  @override
  String get areYouSureYouWishToSignOut =>
      'Voulez-vous vraiment vous déconnecter?';

  @override
  String get unableToSignOut => 'Impossible de se déconnecter';
}
