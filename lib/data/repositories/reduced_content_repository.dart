import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/data/datasources/remote/reduced_content_remote_datasource.dart';
import 'package:les_mediateurs/domain/models/content/reduced_content.dart';
import 'package:les_mediateurs/domain/repositories/reduced_content_repository.dart';

final reducedContentRepositoryProvider = Provider<IReducedContentRepository>((ref) {
  return ReducedContentRepository(reducedContentRemoteDatasource: ref.read(contentMiniaturisedRemoteDatasourceProvider));
});

final class ReducedContentRepository extends IReducedContentRepository {
  final ReducedContentRemoteDatasource reducedContentRemoteDatasource;

  ReducedContentRepository({required this.reducedContentRemoteDatasource});

  @override
  Future<List<ReducedContent>> getReducedContentsByPage(int page) async {
    final jsonResponse = reducedContentRemoteDatasource.fetchContentMiniaturisedByPage(page);

    if (jsonResponse is! List) {
      return [];
    }

    return jsonResponse.map((e) => ReducedContent.fromJson(e)).toList();
  }
}
