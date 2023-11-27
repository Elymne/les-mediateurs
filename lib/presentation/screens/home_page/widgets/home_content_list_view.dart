import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/constants.dart';
import 'package:les_mediateurs/presentation/screens/home_page/providers/home_content_list_view_state_provider.dart';
import 'package:les_mediateurs/core/state/enum_state_status.dart';
import 'package:les_mediateurs/presentation/screens/home_page/widgets/unused/home_content_list_view_item.dart';
import 'package:les_mediateurs/presentation/widgets/custom_grid/custom_grid.dart';

class HomeContentListView extends ConsumerStatefulWidget {
  const HomeContentListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomeContentListView> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      ref.read(homeContentListViewStateProvider.notifier).loadContentFromPage(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeContentListViewState = ref.watch(homeContentListViewStateProvider);

    if (homeContentListViewState.status == StateStatus.loading || homeContentListViewState.status == StateStatus.init) {
      return Container(
        color: Colors.white,
        height: 600,
        child: const Center(child: CircularProgressIndicator(color: Colors.red)),
      );
    }

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 60),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.newspaper, size: 40),
                  SizedBox(width: 10),
                  Text(
                    'Derniers contenus',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      wordSpacing: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              CustomGrid(
                itemCount: homeContentListViewState.reducedContents.length,
                itemPerRow: 1,
                rowMargin: 40,
                builder: (index) {
                  return HomeContentListViewItem(
                    reducedContent: homeContentListViewState.reducedContents[index],
                  );
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      );
    }

    if (size.width < smallScreenCapWith) {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 60),
              const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.newspaper, size: 40),
                  SizedBox(width: 10),
                  Text(
                    'Derniers contenus',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      wordSpacing: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              CustomGrid(
                itemCount: homeContentListViewState.reducedContents.length,
                itemPerRow: 1,
                rowMargin: 40,
                builder: (index) {
                  return HomeContentListViewItem(
                    reducedContent: homeContentListViewState.reducedContents[index],
                    isMobileDisplay: true,
                  );
                },
              ),
              const SizedBox(height: 60),
            ],
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
            width: 1200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 60),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.newspaper, size: 40),
                    SizedBox(width: 10),
                    Text(
                      'Derniers contenus',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                CustomGrid(
                  itemCount: homeContentListViewState.reducedContents.length,
                  itemPerRow: 1,
                  rowMargin: 40,
                  builder: (index) {
                    return HomeContentListViewItem(
                      reducedContent: homeContentListViewState.reducedContents[index],
                    );
                  },
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
