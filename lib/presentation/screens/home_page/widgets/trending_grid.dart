import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/constants.dart';
import 'package:les_mediateurs/core/state/enum_state_status.dart';
import 'package:les_mediateurs/presentation/screens/home_page/providers/trending_grid_state_provider.dart';
import 'package:les_mediateurs/presentation/screens/home_page/widgets/trending_item.dart';

class TrendingList extends ConsumerStatefulWidget {
  const TrendingList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<TrendingList> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      ref.read(trendingGridStateProvider.notifier).loadTrendings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TrendingGridState state = ref.watch(trendingGridStateProvider);

    if (state.status == StateStatus.init) {
      return Container(height: 400, color: Colors.white);
    }

    if (state.status == StateStatus.loading) {
      return Container(
        height: 400,
        color: Colors.white,
        child: const CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }

    if (state.status == StateStatus.error) {
      return Container(
        height: 400,
        color: Colors.white,
        child: Center(
          child: Text(
            state.errorMessage,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
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
                        trending: state.trendings[0],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 2,
                        trending: state.trendings[1],
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
                        trending: state.trendings[2],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 4,
                        trending: state.trendings[3],
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
                        trending: state.trendings[4],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 6,
                        trending: state.trendings[5],
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
            height: 900,
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
                  trending: state.trendings[0],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 2,
                  trending: state.trendings[1],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 3,
                  trending: state.trendings[2],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 4,
                  trending: state.trendings[3],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 5,
                  trending: state.trendings[4],
                ),
                const SizedBox(height: 10),
                TrendingItem(
                  number: 6,
                  trending: state.trendings[5],
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
                        trending: state.trendings[0],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 2,
                        trending: state.trendings[1],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 3,
                        trending: state.trendings[2],
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
                        trending: state.trendings[3],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 5,
                        trending: state.trendings[4],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TrendingItem(
                        number: 6,
                        trending: state.trendings[5],
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
