import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/presentation/screens/home_page/widgets/catch_text_container.dart';
import 'package:les_mediateurs/presentation/screens/home_page/widgets/home_content_list_view.dart';
import 'package:les_mediateurs/presentation/screens/home_page/widgets/home_background.dart';
import 'package:les_mediateurs/presentation/screens/home_page/widgets/home_trending_grid_view.dart';
import 'package:les_mediateurs/presentation/widgets/header/header.dart';

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
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Opacity(
                    opacity: fadeInAnimation.value,
                    child: Column(
                      children: [
                        const CatchTextContainer(),
                        Divider(height: 1, color: Colors.grey.shade100),
                        const HomeTrendingGridView(),
                        Divider(height: 1, color: Colors.grey.shade100),
                        const HomeContentListView(),
                      ],
                    ),
                  ),
                ),
              ),

            ///
            if (canDisplayContent)
              Opacity(
                opacity: fadeInAnimation.value,
                child: const Header(),
              ),
          ],
        ),
      ),
    );
  }
}
