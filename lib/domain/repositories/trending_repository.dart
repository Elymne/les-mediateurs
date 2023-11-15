import 'package:les_mediateurs/domain/models/trending.dart';

abstract class ITrendingRepository {
  Future<List<Trending>> getCurrentTrendings();
}
