import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/shared/widgets/animated_text/animated_text.dart';
import 'package:uuid/uuid.dart';

class HomeBackground extends ConsumerStatefulWidget {
  final bool skipAnimation;

  const HomeBackground({
    super.key,
    this.skipAnimation = false,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomeBackground> {
  final Uuid uuid = const Uuid();

  // To manage screen size update while animating text.
  late final String _animatedTextKeyL = uuid.v4();
  late final String _animatedTextKeyM = uuid.v4();
  late final String _animatedTextKeyS = uuid.v4();

  bool isAnimationOver = false;

  @override
  void initState() {
    isAnimationOver = widget.skipAnimation;

    // TODO: gérer ça.
    if (isAnimationOver == false) {}

    // TODO: implement initState and animation/display.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width < 1200 && size.width >= 800) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0x00000000).withOpacity(0.9),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.45),
              child: AnimatedText(
                key: Key(_animatedTextKeyM),
                data: "LES MÉDIATEURS,\nPAR BENJAMIN ROBICHON",
                duration: const Duration(milliseconds: 600),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (size.width < 800) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0x00000000).withOpacity(0.9),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.35),
              child: AnimatedText(
                key: Key(_animatedTextKeyS),
                data: "LES MÉDIATEURS,\nPAR\nBENJAMIN\nROBICHON",
                duration: const Duration(milliseconds: 600),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0x00000000).withOpacity(0.9),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.25,
              left: 100,
            ),
            child: AnimatedText(
              key: Key(_animatedTextKeyL),
              data: "LES MÉDIATEURS,\nPAR BENJAMIN ROBICHON",
              duration: const Duration(milliseconds: 600),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
