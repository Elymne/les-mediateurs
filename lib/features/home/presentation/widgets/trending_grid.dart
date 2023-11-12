import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/configurations/constantes.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/trending_item.dart';

class TrendingList extends ConsumerStatefulWidget {
  const TrendingList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<TrendingList> {
  final List<String> data = [
    "CACA",
    "TOILETTE",
    "BITE ENORME",
    "CHIASSE GALACTIQUE",
    "ETRON LUNAIRE",
    "PARTOUZE AVEC VIEUX",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            height: 600,
            width: size.width - 80,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.trending_up, size: 40),
                    SizedBox(width: 10),
                    Text(
                      'Contenu du moment',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        index: 0,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        index: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        index: 2,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        index: 3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        index: 4,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        index: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (size.width < smallScreenCapWith) {
      final double scaleFactor = ((size.width) / 8) / 100;
      print(scaleFactor);
      return Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.trending_up, size: 40),
                    SizedBox(width: 10),
                    Text(
                      'Contenu du moment',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TrendingItem(
                  index: 5,
                ),
                SizedBox(height: 10),
                TrendingItem(
                  index: 5,
                ),
                SizedBox(height: 10),
                TrendingItem(
                  index: 5,
                ),
                SizedBox(height: 10),
                TrendingItem(
                  index: 5,
                ),
                SizedBox(height: 10),
                TrendingItem(
                  index: 5,
                ),
                SizedBox(height: 10),
                TrendingItem(
                  index: 5,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: largeScreenDisplayWidth,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.trending_up, size: 40),
                    SizedBox(width: 10),
                    Text(
                      'Contenu du moment',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        index: 0,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        index: 1,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        index: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        index: 3,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        index: 4,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        index: 5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
