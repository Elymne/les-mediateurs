import 'package:les_mediateurs/features/home/domain/models/trending.dart';

abstract class ITrendingRepository {
  Future<List<Trending>> getCurrentTrendings();
}
