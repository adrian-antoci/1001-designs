// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => '1001 Designs';

  @override
  String get loading => 'Loading...';

  @override
  String get itWontTakeLong => 'It won\'t take long';

  @override
  String get someWentWrong => ':( Something went wrong';

  @override
  String get pleaseTryAgain => 'Please try again';

  @override
  String get searchByName => 'Search by name...';
}
