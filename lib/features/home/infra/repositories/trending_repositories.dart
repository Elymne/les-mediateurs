import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/features/home/domain/models/trending.dart';
import 'package:les_mediateurs/features/home/domain/repositories/trending_repository.dart';
import 'package:les_mediateurs/features/home/infra/datasources/trending_remote_datasource.dart';

final trendingReposity = Provider<TrendingRepository>((ref) {
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

    for (var data in jsonResponse) {
      final trending = Trending.fromJson(data);
    }

    return jsonResponse.map((e) => Trending.fromJson(e)).toList();
  }
}
