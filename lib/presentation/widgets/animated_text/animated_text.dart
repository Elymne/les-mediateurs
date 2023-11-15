import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String data;
  final Duration duration;
  final TextAlign? textAlign;
  final TextStyle? style;

  const AnimatedText({
    super.key,
    required this.data,
    required this.duration,
    this.style,
    this.textAlign,
  });

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<AnimatedText> {
  String value = '';

  @override
  void initState() {
    super.initState();
    final t = (widget.duration.inMilliseconds / widget.data.length);
    delayedMacro(t.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: widget.textAlign,
      style: widget.style,
    );
  }

  void delayedMacro(int t) {
    if (widget.data.length == value.length) {
      return;
    }

    Timer(Duration(milliseconds: t), () {
      setState(() {
        value += widget.data[value.length];
      });
      delayedMacro(t);
    });
  }
}
