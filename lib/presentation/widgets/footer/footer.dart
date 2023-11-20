import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:les_mediateurs/core/constants.dart';
import 'package:les_mediateurs/presentation/widgets/link_text/link_text.dart';

class Footer extends ConsumerStatefulWidget {
  const Footer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<Footer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return const SizedBox();
    }

    if (size.width < smallScreenCapWith) {
      return const SizedBox();
    }

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: largeScreenDisplayWidth,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 48, 48, 48),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(40),
                  topEnd: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/instagram_icon.svg',
                          height: 40,
                        ),
                        const SizedBox(width: 20),
                        const Linktext(
                          text: 'Instagram',
                          color: Colors.white,
                          hoverColor: Color.fromARGB(255, 204, 79, 156),
                          redirection: 'Bite au frommage',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/youtube_icon.svg',
                          height: 40,
                        ),
                        const SizedBox(width: 20),
                        const Linktext(
                          text: 'Youtube',
                          color: Colors.white,
                          hoverColor: Color.fromARGB(255, 204, 79, 79),
                          redirection: 'Bite au frommage',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/facebook_icon.svg',
                          height: 40,
                        ),
                        const SizedBox(width: 20),
                        const Linktext(
                          text: 'Facebook',
                          color: Colors.white,
                          hoverColor: Color.fromARGB(255, 79, 108, 204),
                          redirection: 'Bite au frommage',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/twitter_icon.svg',
                          height: 40,
                        ),
                        const SizedBox(width: 20),
                        const Linktext(
                          text: 'Twitter',
                          color: Colors.white,
                          hoverColor: Color.fromARGB(255, 79, 169, 204),
                          redirection: 'Bite au frommage',
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
