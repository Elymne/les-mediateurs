import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/datasource/remote_datasource.dart';
import 'package:les_mediateurs/core/dio/dio_provider.dart';
import 'package:uuid/uuid.dart';

final trendingRemoteDatasourceProvider = Provider((ref) {
  return TrendingRemoteDatasource(dio: ref.read(dioProvider));
});

class TrendingRemoteDatasource extends RemoteDatasource {
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
          'content_type': 'article',
          'created_at': '1969-07-20 20:18:04Z',
          'updated_at': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Maecenas consectetur magna a scelerisque tempor. Mauris consequat ut urna.',
          'content_type': 'article',
          'created_at': '1969-07-20 20:18:04Z',
          'updated_at': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Etiam cursus eu libero iaculis tincidunt. Etiam in lacus id lectus elementum tempor.",
          'content_type': 'article',
          'created_at': '1969-07-20 20:18:04Z',
          'updated_at': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Nunc at malesuada ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.",
          'content_type': 'article',
          'created_at': '1969-07-20 20:18:04Z',
          'updated_at': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Sed quis est eros. Curabitur tempor vel turpis non semper.",
          'content_type': 'article',
          'created_at': '1969-07-20 20:18:04Z',
          'updated_at': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Cras nulla dolor, elementum id enim ultricies, posuere sollicitudin ante. Fusce sagittis.',
          'content_type': 'ytvideo',
          'created_at': '1969-07-20 20:18:04Z',
          'updated_at': '1969-08-20 20:18:04Z',
        },
      ],
    );

    return response.data;
  }
}
