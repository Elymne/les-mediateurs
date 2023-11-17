import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/log/logger.dart';
import 'package:les_mediateurs/core/usecase/usecase.dart';
import 'package:les_mediateurs/data/repositories/reduced_content_repository.dart';
import 'package:les_mediateurs/domain/models/content/reduced_content.dart';
import 'package:les_mediateurs/domain/repositories/reduced_content_repository.dart';

final getContentMiniaturisedByPageUsecaseProvider = Provider<GetHomePageContentsUsecase>((ref) {
  return GetHomePageContentsUsecase(reducedContentRepository: ref.read(reducedContentRepositoryProvider));
});

class GetHomePageContentsUsecase extends Usecase<List<ReducedContent>, GetContentMiniaturisedByPageUsecaseParams> {
  final IReducedContentRepository reducedContentRepository;

  GetHomePageContentsUsecase({required this.reducedContentRepository});

  @override
  Future<Result<List<ReducedContent>>> perform(GetContentMiniaturisedByPageUsecaseParams params) async {
    try {
      final contentMiniatuiseds = await reducedContentRepository.getReducedContentsByPage(params.page);

      if (contentMiniatuiseds.length > 10) {
        logger.w('Too much data received from content API, should be 10. It was ${contentMiniatuiseds.length}.');
      }

      return Success(value: contentMiniatuiseds);
    } on Exception catch (e) {
      logger.e(e);
      return Failure(exception: e);
    }
  }
}

class GetContentMiniaturisedByPageUsecaseParams extends Params {
  final int page;

  GetContentMiniaturisedByPageUsecaseParams({required this.page});
}
