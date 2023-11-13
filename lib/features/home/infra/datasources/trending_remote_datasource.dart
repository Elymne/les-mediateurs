import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/remote_data_source.dart';
import 'package:les_mediateurs/shared/dio/dio_provider.dart';
import 'package:uuid/uuid.dart';

final trendingRemoteDatasourceProvider = Provider((ref) {
  return TrendingRemoteDatasource(dio: ref.read(dioProvider));
});

class TrendingRemoteDatasource extends RemoteDataSource {
  final uuid = const Uuid();

  TrendingRemoteDatasource({required super.dio});

  /// TODO: just mocked values for now.
  dynamic fetchCurrentTrendings() async {
    // Simulate response.
    final Response response = Response(
      requestOptions: RequestOptions(),
      data: [
        {
          'id': uuid.v4(),
          'title': 'Gros jambon de paris dans la sèvre',
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Gendarme joue à pan-pan la police tuer tuer débilous',
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "J'ai plus de chips, comment j'vais faire ?",
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "J'ai pêché un énorme poisson dans la graisse de porc utilisé pour faire les frites Belges",
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "J'ai rien à dire, bon bah..",
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Article très intéressant',
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
      ],
    );

    return response.data;
  }
}
