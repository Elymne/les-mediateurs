import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBackground extends ConsumerStatefulWidget {
  const HomeBackground({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomeBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}
