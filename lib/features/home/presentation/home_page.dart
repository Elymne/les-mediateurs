import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/catch_text_container.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/content_miniaturised_list.dart';
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
// Just a simple opacity animation.
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late final Animation<double> fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
  )..addListener(() => setState(() {}));

  bool canDisplayContent = false;

  // TODO Gérer ça proprement nom d'une chienne.
  final List<Widget> contents = [
    const CatchTextContainer(),
    const Divider(height: 1, color: Colors.grey),
    const TrendingList(),
    const Divider(height: 1, color: Colors.grey),
    const ContentMiniaturisedList(),
  ];

  @override
  void initState() {
    super.initState();

    if (widget.shouldSkipAnimation == true) {
      animationController.forward();
      canDisplayContent = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    /// TODO Manage or not very small screen.
    if (size.width < 360) {
      // Hideux n'est-ce-pas.
      return const Scaffold(backgroundColor: Colors.black, body: SafeArea(child: Center(child: Text("(:", style: TextStyle(fontSize: 100, color: Colors.white)))));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            HomeBackground(
              skipAnimation: widget.shouldSkipAnimation,
              onAnimationFinished: () {
                animationController.forward();
                setState(() {
                  canDisplayContent = true;
                });
              },
            ),
            if (canDisplayContent)
              Opacity(
                opacity: fadeInAnimation.value,
                child: const Header(),
              ),
            if (canDisplayContent)
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Opacity(
                  opacity: fadeInAnimation.value,
                  child: ListView.builder(
                    shrinkWrap: true,
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
}
