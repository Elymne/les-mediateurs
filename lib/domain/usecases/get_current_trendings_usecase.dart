import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/usecase/usecase.dart';
import 'package:les_mediateurs/data/repositories/trending_repositories.dart';
import 'package:les_mediateurs/domain/models/trending.dart';

final getCurrentTrendingsUsecaseProvider = Provider((ref) {
  return GetCurrentTrendingsUsecase(trendingRepository: ref.read(trendingReposity));
});

class GetCurrentTrendingsUsecase extends UsecaseNoParams<List<Trending>> {
  final TrendingRepository trendingRepository;

  GetCurrentTrendingsUsecase({required this.trendingRepository});

  @override
  Future<Result<List<Trending>>> perform() async {
    try {
      final trendings = await trendingRepository.getCurrentTrendings();

      if (trendings.length > 6) {
        // TODO: warning log, too much element returned by the getCurrentTrendings() method.
      }

      return Success(value: trendings);
    } on Exception catch (e) {
      // TODO: log error.
      return Failure(exception: e);
    }
  }
}
