import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/data/datasources/remote/content_miniaturised_remote_datasource.dart';
import 'package:les_mediateurs/domain/models/content_miniaturised.dart';
import 'package:les_mediateurs/domain/repositories/content_miniaturised.dart';

final contentMiniaturisedRepositoryProvider = Provider<ContentMiniaturisedRepository>((ref) {
  return ContentMiniaturisedRepository(contentMiniaturisedRemoteDatasource: ref.read(contentMiniaturisedRemoteDatasourceProvider));
});

final class ContentMiniaturisedRepository extends IContentMiniaturisedRepository {
  final ContentMiniaturisedRemoteDatasource contentMiniaturisedRemoteDatasource;

  ContentMiniaturisedRepository({required this.contentMiniaturisedRemoteDatasource});

  @override
  Future<List<ContentMiniaturised>> getContentMiniaturiseds(int page) async {
    final jsonResponse = contentMiniaturisedRemoteDatasource.fetchContentMiniaturisedByPage(page);

    if (jsonResponse is! List) {
      return [];
    }

    return jsonResponse.map((e) => ContentMiniaturised.fromJson(e)).toList();
  }
}
