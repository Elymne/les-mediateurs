import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/catch_text_container.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/home_background.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/trending_grid.dart';
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
  double opacity = 0;

// Just a simple opacity animation.
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late final Animation<double> fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
  )..addListener(() => setState(() => opacity = fadeInAnimation.value));

  // TODO Gérer ça proprement nom d'une chienne.
  final List<Widget> contents = [
    const CatchTextContainer(),
    const TrendingList(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.shouldSkipAnimation == false) {
      startAnimation();
    } else {
      opacity = 1;
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
            Opacity(
              opacity: opacity,
              child: const Header(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Opacity(
                opacity: opacity,
                child: ListView.builder(
                  itemCount: contents.length,
                  itemBuilder: (context, index) {
                    return contents[index];
                  },
                ),
              ),
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
