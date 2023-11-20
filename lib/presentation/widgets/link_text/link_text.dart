import 'package:flutter/material.dart';

class Linktext extends StatefulWidget {
  final String text;
  final String redirection;
  final Color color;
  final Color hoverColor;

  const Linktext({super.key, required this.hoverColor, required this.redirection, required this.text, required this.color});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Linktext> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    final curveAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    colorAnimation = ColorTween(begin: widget.color, end: widget.hoverColor).animate(curveAnimation);
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
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            wordSpacing: -1,
            color: colorAnimation.value,
          ),
        ),
      ),
    );
  }
}
