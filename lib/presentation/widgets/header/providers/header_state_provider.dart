import 'package:flutter_riverpod/flutter_riverpod.dart';

final headerStateProvider = StateProvider<SelectedPage>((ref) => SelectedPage.home);

enum SelectedPage { home, aboutUs, signIn, auth }
