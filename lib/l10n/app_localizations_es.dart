// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Star Wars app';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get important => 'Importante';

  @override
  String get skip => 'Saltar';

  @override
  String get areYouSureYouWishToSignOut =>
      '¿Está seguro de que desea cerrar la sesión?';

  @override
  String get unableToSignOut => 'No se puede cerrar sesión';
}
