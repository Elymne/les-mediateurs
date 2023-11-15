import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/domain/models/trending.dart';
import 'package:les_mediateurs/domain/usecases/get_current_trendings_usecase.dart';

final trendingGridStateProvider = StateNotifierProvider<TrendingGridNotifier, List<Trending>>((ref) {
  return TrendingGridNotifier(ref.read(getCurrentTrendingsUsecaseProvider));
});

class TrendingGridNotifier extends StateNotifier<List<Trending>> {
  final GetCurrentTrendingsUsecase _getCurrentTrendingsUsecase;

  TrendingGridNotifier(this._getCurrentTrendingsUsecase) : super([]);

  Future loadTrendings() async {
    final trendings = await _getCurrentTrendingsUsecase.perform();
    state = trendings;
  }

  /// TODO: Débile, j'aime bien. (C'est juste pour mon cerveau malade pour plus tard).
  Future reloadTrendings() async {
    final trendings = await _getCurrentTrendingsUsecase.perform();
    state = trendings;
  }
}
