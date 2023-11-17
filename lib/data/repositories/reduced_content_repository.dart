import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/data/datasources/remote/content_miniaturised_remote_datasource.dart';
import 'package:les_mediateurs/domain/models/content/reduced_content.dart';
import 'package:les_mediateurs/domain/repositories/reduced_content_repository.dart';

final reducedContentRepositoryProvider = Provider<IReducedContentRepository>((ref) {
  return ReducedContentRepository(contentMiniaturisedRemoteDatasource: ref.read(contentMiniaturisedRemoteDatasourceProvider));
});

final class ReducedContentRepository extends IReducedContentRepository {
  final ContentMiniaturisedRemoteDatasource contentMiniaturisedRemoteDatasource;

  ReducedContentRepository({required this.contentMiniaturisedRemoteDatasource});

  @override
  Future<List<ReducedContent>> getReducedContentsByPage(int page) async {
    final jsonResponse = contentMiniaturisedRemoteDatasource.fetchContentMiniaturisedByPage(page);

    if (jsonResponse is! List) {
      return [];
    }

    return jsonResponse.map((e) => ReducedContent.fromJson(e)).toList();
  }
}
