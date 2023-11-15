import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/constantes.dart';
import 'package:les_mediateurs/core/l10n/locals.dart';
import 'package:les_mediateurs/core/l10n/providers/locals_provider.dart';
import 'package:les_mediateurs/presentation/widgets/animated_text/animated_text.dart';

class CatchTextContainer extends ConsumerStatefulWidget {
  const CatchTextContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<CatchTextContainer> {
  late final Locals locals = ref.read(localsProvider);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedText(
                data: locals.getLocals(context).home_page_catch_phrase,
                duration: const Duration(milliseconds: 800),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w300,
                ),
              ),
              AnimatedText(
                data: locals.getLocals(context).home_page_catch_phrase_bis,
                duration: const Duration(milliseconds: 1200),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (size.width < smallScreenCapWith) {
      return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            AnimatedText(
              data: locals.getLocals(context).home_page_catch_phrase,
              duration: const Duration(milliseconds: 800),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          width: largeScreenDisplayWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedText(
                data: locals.getLocals(context).home_page_catch_phrase,
                duration: const Duration(milliseconds: 800),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.w300,
                ),
              ),
              AnimatedText(
                data: locals.getLocals(context).home_page_catch_phrase_bis,
                duration: const Duration(milliseconds: 1200),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
