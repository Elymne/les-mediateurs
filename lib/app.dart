import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/presentation/screens/home_page/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:les_mediateurs/core/l10n/providers/locals_provider.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locals = ref.watch(localsProvider);
    locals.setLocale(const Locale('fr', 'FR'));

    return MaterialApp(
      title: 'apl.current.appName',
      debugShowCheckedModeBanner: false,
      home: const HomePage(
        shouldSkipAnimation: false,
      ),
      themeMode: ThemeMode.system,
      // TODO : create preset theme data.
      // TODO : create preset colors const.
      // TODO : create preset texts const.
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
