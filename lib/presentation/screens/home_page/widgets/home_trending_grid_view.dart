import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/constants.dart';
import 'package:les_mediateurs/core/state/enum_state_status.dart';
import 'package:les_mediateurs/presentation/screens/home_page/providers/trending_grid_state_provider.dart';
import 'package:les_mediateurs/presentation/screens/home_page/widgets/home_trending_grid_view_item.dart';
import 'package:les_mediateurs/presentation/widgets/custom_grid/custom_grid.dart';

class HomeTrendingGridView extends ConsumerStatefulWidget {
  const HomeTrendingGridView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomeTrendingGridView> {
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
                CustomGrid(
                  itemPerRow: 2,
                  itemCount: state.trendings.length,
                  rowMargin: 20,
                  margeBetweenItem: 10,
                  builder: (index) {
                    return HomeTrendingGridViewItem(
                      number: index + 1,
                      trending: state.trendings[index],
                    );
                  },
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
                CustomGrid(
                  itemPerRow: 1,
                  itemCount: state.trendings.length,
                  rowMargin: 20,
                  margeBetweenItem: 10,
                  builder: (index) {
                    return HomeTrendingGridViewItem(
                      number: index + 1,
                      trending: state.trendings[index],
                    );
                  },
                ),
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
                CustomGrid(
                  itemPerRow: 3,
                  itemCount: state.trendings.length,
                  rowMargin: 30,
                  margeBetweenItem: 10,
                  builder: (index) {
                    return HomeTrendingGridViewItem(
                      number: index + 1,
                      trending: state.trendings[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
