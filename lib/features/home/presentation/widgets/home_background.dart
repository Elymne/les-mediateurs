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
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background_1.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: const Color(0x00000000).withOpacity(0.85),
        child: Align(
          //alignment: Alignment(x, size.height / 2),
          child: Text(
            "PETIT TEST Là",
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }
}
