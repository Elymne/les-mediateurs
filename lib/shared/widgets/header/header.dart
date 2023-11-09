import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/shared/data/local/locals.dart';
import 'package:les_mediateurs/shared/domain/providers/locals_provider/locals_provider.dart';
import 'package:les_mediateurs/shared/widgets/header/items/header_home_item.dart';
import 'package:les_mediateurs/shared/widgets/header/items/header_home_item_reduced.dart';
import 'package:les_mediateurs/shared/widgets/header/items/header_item.dart';
import 'package:les_mediateurs/shared/widgets/header/items/header_menu_button.dart';
import 'package:les_mediateurs/shared/widgets/header/providers/header_state_provider.dart';

class Header extends ConsumerStatefulWidget {
  const Header({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<Header> {
  late final Locals locals = ref.watch(localsProvider);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final currentPage = ref.watch(headerStateProvider);

    if (width < 1200 && width >= 800) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            bottom: BorderSide(
              width: 0.2,
              color: Colors.black,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Stack(
            children: [
              HeaderMenuButton(
                onClick: () {},
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
        ),
      );
    }

    if (width < 800) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            bottom: BorderSide(
              width: 0.2,
              color: Colors.black,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
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
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.black,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: 1200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      HeaderHomeItem(
                        onClick: () {
                          ref.read(headerStateProvider.notifier).state = SelectedPage.home;
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 30),
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
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
