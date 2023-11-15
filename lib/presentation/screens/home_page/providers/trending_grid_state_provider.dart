import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/state/enum_state_status.dart';
import 'package:les_mediateurs/core/usecase/usecase.dart';
import 'package:les_mediateurs/domain/models/trending.dart';
import 'package:les_mediateurs/domain/usecases/get_current_trendings_usecase.dart';

final trendingGridStateProvider = StateNotifierProvider<TrendingGridNotifier, TrendingGridState>((ref) {
  return TrendingGridNotifier(ref.read(getCurrentTrendingsUsecaseProvider));
});

class TrendingGridState {
  final List<Trending> trendings;
  final String errorMessage;
  final StateStatus status;

  TrendingGridState({required this.trendings, required this.status, required this.errorMessage});

  const TrendingGridState.initiate({
    this.trendings = const [],
    this.errorMessage = '',
    this.status = StateStatus.init,
  });
}

class TrendingGridNotifier extends StateNotifier<TrendingGridState> {
  final GetCurrentTrendingsUsecase _getCurrentTrendingsUsecase;

  TrendingGridNotifier(this._getCurrentTrendingsUsecase) : super(const TrendingGridState.initiate());

  Future loadTrendings() async {
    if (state.status == StateStatus.loading) return;

    state = TrendingGridState(
      trendings: const [],
      errorMessage: '',
      status: StateStatus.loading,
    );

    final result = await _getCurrentTrendingsUsecase.perform();

    if (result is Failure) {
      state = TrendingGridState(
        trendings: const [],
        errorMessage: 'Error while fetching trendings',
        status: StateStatus.error,
      );
      return;
    }

    if (result is Success) {
      state = TrendingGridState(
        trendings: (result as Success).value,
        errorMessage: '',
        status: StateStatus.sucess,
      );
      return;
    }
  }
}
