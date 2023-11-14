import 'package:les_mediateurs/features/home/domain/models/content_miniaturised.dart';

abstract class IContentMiniaturisedRepository {
  Future<List<ContentMiniaturised>> getContentMiniaturiseds(int page);
}
