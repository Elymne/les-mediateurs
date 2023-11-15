import 'package:les_mediateurs/domain/models/content_miniaturised.dart';

abstract class IContentMiniaturisedRepository {
  Future<List<ContentMiniaturised>> getContentMiniaturiseds(int page);
}
