import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/usecase/usecase.dart';
import 'package:les_mediateurs/domain/models/content_miniaturised.dart';
import 'package:les_mediateurs/domain/usecases/get_content_miniaturised_by_page_usecase.dart';
import 'package:les_mediateurs/core/state/enum_state_status.dart';

final contentMiniaturisedListStateProvider = StateNotifierProvider<ContentMiniaturisedListNotifier, ContentMiniaturisedListState>((ref) {
  return ContentMiniaturisedListNotifier(ref.read(getContentMiniaturisedByPageUsecaseProvider));
});

class ContentMiniaturisedListState {
  final int currentPage;
  final List<ContentMiniaturised> contentMiniaturiseds;
  final String errorMessage;
  final StateStatus status;

  ContentMiniaturisedListState({
    required this.currentPage,
    required this.contentMiniaturiseds,
    required this.errorMessage,
    required this.status,
  });

  const ContentMiniaturisedListState.init({
    this.currentPage = 0,
    this.contentMiniaturiseds = const [],
    this.errorMessage = '',
    this.status = StateStatus.init,
  });
}

class ContentMiniaturisedListNotifier extends StateNotifier<ContentMiniaturisedListState> {
  final GetContentMiniaturisedByPageUsecase _getContentMiniaturisedByPageUsecase;

  ContentMiniaturisedListNotifier(this._getContentMiniaturisedByPageUsecase) : super(const ContentMiniaturisedListState.init());

  Future loadContentFromPage(int page) async {
    if (state.status == StateStatus.loading) return;

    state = ContentMiniaturisedListState(
      currentPage: page,
      contentMiniaturiseds: [],
      errorMessage: '',
      status: StateStatus.loading,
    );

    final result = await _getContentMiniaturisedByPageUsecase.perform(GetContentMiniaturisedByPageUsecaseParams(page: page));

    if (result is Failure) {
      state = ContentMiniaturisedListState(
        currentPage: page,
        contentMiniaturiseds: [],
        errorMessage: 'Error while fetching articles',
        status: StateStatus.error,
      );
    }

    if (result is Success) {
      state = ContentMiniaturisedListState(
        currentPage: page,
        contentMiniaturiseds: (result as Success).value,
        errorMessage: '',
        status: StateStatus.sucess,
      );
    }
  }
}
