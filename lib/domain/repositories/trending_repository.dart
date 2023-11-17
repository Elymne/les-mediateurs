import 'package:les_mediateurs/domain/models/content/trending.dart';

abstract class ITrendingRepository {
  Future<List<Trending>> getCurrentTrendings();
}
