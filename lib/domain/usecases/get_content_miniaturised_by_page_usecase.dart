import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/usecase/usecase.dart';
import 'package:les_mediateurs/data/repositories/content_miniaturised_repository.dart';
import 'package:les_mediateurs/domain/models/content_miniaturised.dart';

final getContentMiniaturisedByPageUsecaseProvider = Provider<GetContentMiniaturisedByPageUsecase>((ref) {
  return GetContentMiniaturisedByPageUsecase(contentMiniaturisedRepository: ref.read(contentMiniaturisedRepositoryProvider));
});

class GetContentMiniaturisedByPageUsecase extends Usecase<List<ContentMiniaturised>, GetContentMiniaturisedByPageUsecaseParams> {
  final ContentMiniaturisedRepository contentMiniaturisedRepository;

  GetContentMiniaturisedByPageUsecase({required this.contentMiniaturisedRepository});

  @override
  Future<Result<List<ContentMiniaturised>>> perform(GetContentMiniaturisedByPageUsecaseParams params) async {
    try {
      final contentMiniatuiseds = await contentMiniaturisedRepository.getContentMiniaturiseds(params.page);

      if (contentMiniatuiseds.length > 10) {
        //TODO Log warning.
      }

      return Success(value: contentMiniatuiseds);
    } on Exception catch (e) {
      //TODO: log
      return Failure(exception: e);
    }
  }
}

class GetContentMiniaturisedByPageUsecaseParams extends Params {
  final int page;

  GetContentMiniaturisedByPageUsecaseParams({required this.page});
}
