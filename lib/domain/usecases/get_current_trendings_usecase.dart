import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/log/logger.dart';
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
        logger.w('Too much data received from trendings API, should be 6. It was ${trendings.length}.');
      }

      return Success(value: trendings);
    } on Exception catch (e) {
      logger.e(e);
      return Failure(exception: e);
    }
  }
}
