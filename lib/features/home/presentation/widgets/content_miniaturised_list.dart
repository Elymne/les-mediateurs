import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/features/home/presentation/providers/content_miniaturised_list_state_provider.dart';
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

    if (contentMiniaturisedListState.status == EnumStateStatus.loading) {
      return Container(
        color: Colors.white,
        height: 600,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      );
    }

    if (size.width < 1300) {
      return const SizedBox();
    }

    return Container(
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 1200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Dernier contenu',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    wordSpacing: 0,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
