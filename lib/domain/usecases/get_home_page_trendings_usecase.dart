import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/log/logger.dart';
import 'package:les_mediateurs/core/usecase/usecase.dart';
import 'package:les_mediateurs/data/repositories/trending_repository.dart';
import 'package:les_mediateurs/domain/models/content/trending.dart';
import 'package:les_mediateurs/domain/repositories/trending_repository.dart';

final getCurrentTrendingsUsecaseProvider = Provider((ref) {
  return GetHomePageTrendingsUsecase(trendingRepository: ref.read(trendingReposity));
});

class GetHomePageTrendingsUsecase extends UsecaseNoParams<List<Trending>> {
  final ITrendingRepository trendingRepository;

  GetHomePageTrendingsUsecase({required this.trendingRepository});

  @override
  Future<Result<List<Trending>>> perform() async {
    try {
      final trendings = await trendingRepository.getCurrentTrendings();

      if (trendings.length > 6) {
        logger.w('Too much data received from trendings API, should be 6. It was ${trendings.length}.');
      }

      return Success(value: trendings);
    } catch (e) {
      logger.e(e);
      return Failure(error: e);
    }
  }
}
