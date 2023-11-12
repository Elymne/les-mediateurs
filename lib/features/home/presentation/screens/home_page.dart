import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/home_background.dart';
import 'package:les_mediateurs/shared/widgets/header/header.dart';

class HomePage extends ConsumerStatefulWidget {
  final bool shouldSkipAnimation;

  const HomePage({
    super.key,
    required this.shouldSkipAnimation,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomePage> with SingleTickerProviderStateMixin {
// Just a simple opacity animation.
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late final Animation<double> fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
  )..addListener(() => setState(() {}));

  @override
  void initState() {
    super.initState();
    if (widget.shouldSkipAnimation == false) {
      startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            HomeBackground(skipAnimation: widget.shouldSkipAnimation),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Opacity(
                  opacity: fadeInAnimation.value,
                  child: const Header(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 2200));
    animationController.forward();
  }
}
