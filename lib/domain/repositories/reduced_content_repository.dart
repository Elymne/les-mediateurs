import 'package:les_mediateurs/domain/models/content/reduced_content.dart';

abstract class IReducedContentRepository {
  Future<List<ReducedContent>> getReducedContentsByPage(int page);
}
