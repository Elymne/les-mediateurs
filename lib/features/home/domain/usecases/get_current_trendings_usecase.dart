import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/usecase.dart';
import 'package:les_mediateurs/features/home/domain/models/trending.dart';
import 'package:les_mediateurs/features/home/infra/repositories/trending_repositories.dart';

final getCurrentTrendingsUsecaseProvider = Provider((ref) {
  return GetCurrentTrendingsUsecase(trendingRepository: ref.read(trendingReposity));
});

class GetCurrentTrendingsUsecase extends UsecaseNoParams<List<Trending>> {
  final TrendingRepository trendingRepository;

  GetCurrentTrendingsUsecase({required this.trendingRepository});

  @override
  Future<List<Trending>> perform() async {
    final trendings = await trendingRepository.getCurrentTrendings();

    if (trendings.length > 6) {
      //TODO remove.
    }

    return trendings;
  }
}
