import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/constantes.dart';
import 'package:les_mediateurs/features/home/domain/models/trending.dart';
import 'package:les_mediateurs/features/home/presentation/providers/trending_grid_state_provider.dart';
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
  void initState() {
    super.initState();
    ref.read(trendingGridStateProvider.notifier).loadTrendings();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Trending> trendings = ref.watch(trendingGridStateProvider);

    if (trendings.isEmpty) {
      return Container(
        height: 400,
        color: Colors.white,
        child: const CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            height: 600,
            width: size.width - 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Row(
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
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        number: 1,
                        trending: trendings[0],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 2,
                        trending: trendings[1],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        number: 3,
                        trending: trendings[2],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 4,
                        trending: trendings[3],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        number: 5,
                        trending: trendings[4],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 6,
                        trending: trendings[5],
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
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 30),
                const Row(
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
                const SizedBox(height: 30),
                TrendingItem(
                  number: 1,
                  trending: trendings[0],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 2,
                  trending: trendings[1],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 3,
                  trending: trendings[2],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 4,
                  trending: trendings[3],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 5,
                  trending: trendings[4],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 6,
                  trending: trendings[5],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: largeScreenDisplayWidth,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Row(
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
                const SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        number: 1,
                        trending: trendings[0],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 2,
                        trending: trendings[1],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 3,
                        trending: trendings[2],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TrendingItem(
                        number: 4,
                        trending: trendings[3],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 5,
                        trending: trendings[4],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 6,
                        trending: trendings[5],
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