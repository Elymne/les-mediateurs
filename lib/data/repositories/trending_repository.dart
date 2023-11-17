import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/data/datasources/remote/trending_remote_datasource.dart';
import 'package:les_mediateurs/domain/models/content/trending.dart';
import 'package:les_mediateurs/domain/repositories/trending_repository.dart';

final trendingReposity = Provider<ITrendingRepository>((ref) {
  return TrendingRepository(trendingRemoteDatasource: ref.read(trendingRemoteDatasourceProvider));
});

class TrendingRepository extends ITrendingRepository {
  final TrendingRemoteDatasource trendingRemoteDatasource;

  TrendingRepository({required this.trendingRemoteDatasource});

  @override
  Future<List<Trending>> getCurrentTrendings() async {
    final jsonResponse = await trendingRemoteDatasource.fetchCurrentTrendings();

    if (jsonResponse is! List) {
      return [];
    }

    return jsonResponse.map((e) => Trending.fromJson(e)).toList();
  }
}
