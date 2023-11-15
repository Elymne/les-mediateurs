import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/l10n/locals.dart';
import 'package:les_mediateurs/core/l10n/providers/locals_provider.dart';

class HeaderItem extends ConsumerStatefulWidget {
  final String title;
  final bool isSelected;
  final Function() onClick;

  const HeaderItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onClick,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HeaderItem> with SingleTickerProviderStateMixin {
  late Locals locals = ref.watch(localsProvider);
  late final AnimationController animationController;
  late final Animation<double> animationWidthPourcentage;
  final GlobalKey _sizedBoxKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    final curveAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationWidthPourcentage = Tween<double>(begin: 0, end: 1).animate(curveAnimation);
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
        child: SizedBox(
          key: _sizedBoxKey,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 1),
                Container(color: Colors.black, height: 0.8, width: underlineLenght),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double get underlineLenght {
    final widgetLenght = (_sizedBoxKey.currentContext?.findRenderObject() as RenderBox?)?.size.width ?? 0;

    if (widget.isSelected) {
      return widgetLenght;
    }

    return widgetLenght * animationWidthPourcentage.value;
  }
}
