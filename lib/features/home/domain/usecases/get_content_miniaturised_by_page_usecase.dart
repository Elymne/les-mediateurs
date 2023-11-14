import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/usecase.dart';
import 'package:les_mediateurs/features/home/domain/models/content_miniaturised.dart';
import 'package:les_mediateurs/features/home/infra/repositories/content_miniaturised_repository.dart';

final getContentMiniaturisedByPageUsecaseProvider = Provider<GetContentMiniaturisedByPageUsecase>((ref) {
  return GetContentMiniaturisedByPageUsecase(contentMiniaturisedRepository: ref.read(contentMiniaturisedRepositoryProvider));
});

class GetContentMiniaturisedByPageUsecase extends Usecase<List<ContentMiniaturised>, int> {
  final ContentMiniaturisedRepository contentMiniaturisedRepository;

  GetContentMiniaturisedByPageUsecase({required this.contentMiniaturisedRepository});

  @override
  Future<List<ContentMiniaturised>> perform(int params) async {
    final contentMiniatuiseds = await contentMiniaturisedRepository.getContentMiniaturiseds(params);

    if (contentMiniatuiseds.length > 10) {
      //TODO remove or do something I don't know.
    }

    return contentMiniatuiseds;
  }
}
