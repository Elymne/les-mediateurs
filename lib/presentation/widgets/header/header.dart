import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/constants.dart';
import 'package:les_mediateurs/core/l10n/locals.dart';
import 'package:les_mediateurs/core/l10n/locals_provider.dart';
import 'package:les_mediateurs/presentation/widgets/header/items/header_home_item.dart';
import 'package:les_mediateurs/presentation/widgets/header/items/header_home_item_reduced.dart';
import 'package:les_mediateurs/presentation/widgets/header/items/header_item.dart';
import 'package:les_mediateurs/presentation/widgets/header/items/header_menu_button.dart';
import 'package:les_mediateurs/presentation/widgets/header/providers/header_state_provider.dart';

class Header extends ConsumerStatefulWidget {
  const Header({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<Header> {
  late final Locals locals = ref.watch(localsProvider);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final currentPage = ref.watch(headerStateProvider);

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return Container(
        height: 80,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.2,
              color: Colors.black,
            ),
          ),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: HeaderMenuButton(
                    onClick: () {},
                  ),
                ),
              ],
            ),
            Center(
              child: HeaderHomeItem(
                onClick: () {
                  ref.read(headerStateProvider.notifier).state = SelectedPage.home;
                },
              ),
            ),
          ],
        ),
      );
    }

    if (size.width < smallScreenCapWith) {
      return Container(
        height: 80,
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.2,
              color: Colors.black,
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            HeaderMenuButton(
              onClick: () {
                ref.read(headerStateProvider.notifier).state = SelectedPage.home;
              },
            ),
            const SizedBox(width: 40),
            HeaderHomeItemReduced(
              onClick: () {},
            ),
          ],
        ),
      );
    }

    return Container(
      height: 80,
      width: size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.black,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: largeScreenDisplayWidth,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderHomeItem(
                  onClick: () {
                    ref.read(headerStateProvider.notifier).state = SelectedPage.home;
                  },
                ),
                Row(
                  children: [
                    HeaderItem(
                      title: locals.getLocals(context).header_about_us,
                      isSelected: currentPage == SelectedPage.aboutUs,
                      onClick: () {
                        ref.read(headerStateProvider.notifier).state = SelectedPage.aboutUs;
                      },
                    ),
                    const SizedBox(width: 30),
                    HeaderItem(
                      title: locals.getLocals(context).header_sign_in,
                      isSelected: currentPage == SelectedPage.signIn,
                      onClick: () {
                        ref.read(headerStateProvider.notifier).state = SelectedPage.signIn;
                      },
                    ),
                    const SizedBox(width: 30),
                    HeaderItem(
                      title: locals.getLocals(context).header_auth,
                      isSelected: currentPage == SelectedPage.auth,
                      onClick: () {
                        ref.read(headerStateProvider.notifier).state = SelectedPage.auth;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
