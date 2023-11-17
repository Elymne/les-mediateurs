import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/usecase/usecase.dart';
import 'package:les_mediateurs/domain/models/content/reduced_content.dart';
import 'package:les_mediateurs/domain/usecases/get_home_page_contents_usecase.dart';
import 'package:les_mediateurs/core/state/enum_state_status.dart';

final homeContentListViewStateProvider = StateNotifierProvider<HomeContentListViewNotifier, HomeContentListViewState>((ref) {
  return HomeContentListViewNotifier(ref.read(getContentMiniaturisedByPageUsecaseProvider));
});

class HomeContentListViewState {
  final int currentPage;
  final List<ReducedContent> reducedContents;
  final String errorMessage;
  final StateStatus status;

  HomeContentListViewState({
    required this.currentPage,
    required this.reducedContents,
    required this.errorMessage,
    required this.status,
  });

  const HomeContentListViewState.init({
    this.currentPage = 0,
    this.reducedContents = const [],
    this.errorMessage = '',
    this.status = StateStatus.init,
  });
}

class HomeContentListViewNotifier extends StateNotifier<HomeContentListViewState> {
  final GetHomePageContentsUsecase _getHomePageContentsUsecase;

  HomeContentListViewNotifier(this._getHomePageContentsUsecase) : super(const HomeContentListViewState.init());

  Future loadContentFromPage(int page) async {
    if (state.status == StateStatus.loading) return;

    state = HomeContentListViewState(
      currentPage: page,
      reducedContents: [],
      errorMessage: '',
      status: StateStatus.loading,
    );

    final result = await _getHomePageContentsUsecase.perform(GetContentMiniaturisedByPageUsecaseParams(page: page));

    if (result is Failure) {
      state = HomeContentListViewState(
        currentPage: page,
        reducedContents: [],
        errorMessage: 'Error while fetching articles',
        status: StateStatus.error,
      );
    }

    if (result is Success) {
      state = HomeContentListViewState(
        currentPage: page,
        reducedContents: (result as Success).value,
        errorMessage: '',
        status: StateStatus.sucess,
      );
    }
  }
}
