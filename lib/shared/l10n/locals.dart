import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Locals {
  /// Set the current langage.
  /// Setup this at the beggining of the app.
  /// [Locale] object can be : Locale('FR', 'fr') for example.
  void setLocale(Locale locale) {
    try {
      AppLocalizations.delegate.load(locale);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /// Get the actual appLocalizations to get string translation from arb files.
  AppLocalizations getLocals(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
