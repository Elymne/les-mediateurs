import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/features/home/domain/models/content_miniaturised.dart';
import 'package:les_mediateurs/features/home/domain/usecases/get_content_miniaturised_by_page_usecase.dart';
import 'package:les_mediateurs/shared/state/enum_state_status.dart';

class ContentMiniaturisedListState {
  final int currentPage;
  final List<ContentMiniaturised> contentMiniaturiseds;
  final EnumStateStatus status;

  ContentMiniaturisedListState({
    required this.currentPage,
    required this.contentMiniaturiseds,
    required this.status,
  });

  const ContentMiniaturisedListState.init({
    this.currentPage = 0,
    this.contentMiniaturiseds = const [],
    this.status = EnumStateStatus.init,
  });
}

class ContentMiniaturisedListNotifier extends StateNotifier<ContentMiniaturisedListState> {
  final GetContentMiniaturisedByPageUsecase _getContentMiniaturisedByPageUsecase;

  ContentMiniaturisedListNotifier(this._getContentMiniaturisedByPageUsecase) : super(const ContentMiniaturisedListState.init());

  get isLoading => state.status == EnumStateStatus.loading;

  Future loadContentFromPage(int page) async {
    if (isLoading) {
      // Already fetching data. have to wait.
      return;
    }

    // TODO: utiliser freezed pour le state et faire de la copie.
    state = ContentMiniaturisedListState(currentPage: page, contentMiniaturiseds: [], status: EnumStateStatus.loading);

    final contents = await _getContentMiniaturisedByPageUsecase.perform(page);

    if (contents.isEmpty) {
      state = ContentMiniaturisedListState(currentPage: page, contentMiniaturiseds: [], status: EnumStateStatus.error);
    }

    state = ContentMiniaturisedListState(currentPage: page, contentMiniaturiseds: contents, status: EnumStateStatus.sucess);
  }
}

final contentMiniaturisedListStateProvider = StateNotifierProvider<ContentMiniaturisedListNotifier, ContentMiniaturisedListState>((ref) {
  return ContentMiniaturisedListNotifier(ref.read(getContentMiniaturisedByPageUsecaseProvider));
});
