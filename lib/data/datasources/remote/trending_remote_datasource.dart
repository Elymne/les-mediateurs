import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/remote_data_source.dart';
import 'package:les_mediateurs/core/dio/dio_provider.dart';
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
          'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Maecenas consectetur magna a scelerisque tempor. Mauris consequat ut urna.',
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Etiam cursus eu libero iaculis tincidunt. Etiam in lacus id lectus elementum tempor.",
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Nunc at malesuada ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.",
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Sed quis est eros. Curabitur tempor vel turpis non semper.",
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Cras nulla dolor, elementum id enim ultricies, posuere sollicitudin ante. Fusce sagittis.',
          'type': 'article',
          'created': '1969-07-20 20:18:04Z',
        },
      ],
    );

    return response.data;
  }
}
