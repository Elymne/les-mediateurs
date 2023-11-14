import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/features/home/presentation/providers/content_miniaturised_list_state_provider.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/content_miniaturised_item.dart';
import 'package:les_mediateurs/shared/state/enum_state_status.dart';

class ContentMiniaturisedList extends ConsumerStatefulWidget {
  const ContentMiniaturisedList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<ContentMiniaturisedList> {
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      ref.read(contentMiniaturisedListStateProvider.notifier).loadContentFromPage(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final contentMiniaturisedListState = ref.watch(contentMiniaturisedListStateProvider);

    if (contentMiniaturisedListState.status == EnumStateStatus.loading || contentMiniaturisedListState.status == EnumStateStatus.init) {
      return Container(
        color: Colors.white,
        height: 600,
        child: const Center(child: CircularProgressIndicator(color: Colors.red)),
      );
    }

    if (size.width < 1300) {
      return const SizedBox();
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
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[0],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[1],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[2],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[3],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[4],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[5],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[6],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[7],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[8],
                ),
                const SizedBox(height: 40),
                ContentMiniaturisedItem(
                  contentMiniaturised: contentMiniaturisedListState.contentMiniaturiseds[9],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
