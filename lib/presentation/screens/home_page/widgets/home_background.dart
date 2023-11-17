import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/constants.dart';
import 'package:les_mediateurs/core/l10n/locals.dart';
import 'package:les_mediateurs/core/l10n/locals_provider.dart';
import 'package:les_mediateurs/presentation/widgets/animated_text/animated_text.dart';
import 'package:uuid/uuid.dart';

class HomeBackground extends ConsumerStatefulWidget {
  final bool skipAnimation;
  final void Function() onAnimationFinished;

  const HomeBackground({
    super.key,
    required this.onAnimationFinished,
    this.skipAnimation = false,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomeBackground> with SingleTickerProviderStateMixin {
  late final Locals locals = ref.read(localsProvider);

  // Uuid objetc generator.
  final Uuid uuid = const Uuid();

  // To manage screen size update while animating text.
  late final String _animatedTextKeyL = uuid.v4();
  late final String _animatedTextKeyM = uuid.v4();
  late final String _animatedTextKeyS = uuid.v4();

  // Just a simple opacity animation.
  late final AnimationController animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
  late final Animation<double> fadeOutAnimation = Tween(begin: 1.0, end: 0.0).animate(
    CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
  )
    ..addListener(() => setState(() {}))
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationFinished();
      }
    });

  // 2200 mms.
  bool isAnimationOver = false;

  @override
  void initState() {
    super.initState();
    isAnimationOver = widget.skipAnimation;
    if (isAnimationOver == false) {
      startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0x00000000).withOpacity(0.9),
          ),
          if (isAnimationOver == false)
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.45),
                child: Opacity(
                  opacity: fadeOutAnimation.value,
                  child: AnimatedText(
                    key: Key(_animatedTextKeyM),
                    data: locals.getLocals(context).home_page_app_name,
                    duration: const Duration(milliseconds: 600),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    }

    if (size.width < smallScreenCapWith) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0x00000000).withOpacity(0.9),
          ),
          if (isAnimationOver == false)
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.35),
                child: Opacity(
                  opacity: fadeOutAnimation.value,
                  child: AnimatedText(
                    key: Key(_animatedTextKeyS),
                    data: locals.getLocals(context).home_page_app_name,
                    duration: const Duration(milliseconds: 600),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0x00000000).withOpacity(0.9),
        ),
        if (isAnimationOver == false)
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.25,
                left: 100,
              ),
              child: Opacity(
                opacity: fadeOutAnimation.value,
                child: AnimatedText(
                  key: Key(_animatedTextKeyL),
                  data: locals.getLocals(context).home_page_app_name,
                  duration: const Duration(milliseconds: 600),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  ///
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => isAnimationOver = true);
  }
}
