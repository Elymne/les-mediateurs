import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/l10n/locals.dart';
import 'package:les_mediateurs/core/l10n/locals_provider.dart';

class HeaderMenuButton extends ConsumerStatefulWidget {
  final Function() onClick;

  const HeaderMenuButton({
    super.key,
    required this.onClick,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HeaderMenuButton> with SingleTickerProviderStateMixin {
  late final Locals locals = ref.watch(localsProvider);
  late final AnimationController animationController;
  late final Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    final curveAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    colorAnimation = ColorTween(begin: Colors.black, end: Colors.red).animate(curveAnimation);
    animationController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        animationController.forward();
      },
      onExit: (e) {
        animationController.reverse();
      },
      child: GestureDetector(
        onTap: () => widget.onClick(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.menu,
              color: colorAnimation.value,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
