import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/core/datasource/remote_datasource.dart';
import 'package:les_mediateurs/core/dio/dio_provider.dart';
import 'package:uuid/uuid.dart';

final contentMiniaturisedRemoteDatasourceProvider = Provider<ContentMiniaturisedRemoteDatasource>((ref) {
  return ContentMiniaturisedRemoteDatasource(dio: ref.read(dioProvider));
});

class ContentMiniaturisedRemoteDatasource extends RemoteDatasource {
  final uuid = const Uuid();

  ContentMiniaturisedRemoteDatasource({required super.dio});

  dynamic fetchContentMiniaturisedByPage(int page) {
    final Response response = Response(
      requestOptions: RequestOptions(),
      data: [
        {
          'id': uuid.v4(),
          'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
          'resume':
              'Sed rutrum nisi ut augue tincidunt, id vestibulum neque commodo. Nulla sit amet mi vitae eros sodales bibendum at iaculis eros. Pellentesque eget molestie ligula. Mauris lobortis nibh ac neque bibendum, sit amet interdum nisi posuere. Maecenas ac tristique elit, sit amet efficitur ante. Nullam vehicula ex dui, eu pellentesque ante ultrices blandit. Vestibulum non faucibus lectus. Fusce convallis justo eget justo elementum, vel ultrices metus ornare. Pellentesque elementum ex vel lorem tempor, ac congue nisl semper. Fusce sit amet risus vitae mi condimentum dictum at et urna. ',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Maecenas consectetur magna a scelerisque tempor. Mauris consequat ut urna.',
          'resume':
              'Nunc ac orci eget purus sollicitudin condimentum at sed mi. Ut hendrerit nec lorem eu ullamcorper. Nulla in auctor felis, vitae pellentesque tellus. Vivamus dictum finibus turpis sit amet egestas. Ut vitae neque sed massa posuere varius eu ornare odio. Aenean eleifend tellus a orci posuere vulputate. Fusce vitae fermentum est. Duis in facilisis enim, et venenatis erat. Vivamus id justo commodo, dictum metus at, porta enim. Integer venenatis metus at quam accumsan, eu vulputate nulla venenatis. Maecenas non iaculis lectus. ',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Etiam cursus eu libero iaculis tincidunt. Etiam in lacus id lectus elementum tempor.",
          'resume':
              'Sed rutrum nisi ut augue tincidunt, id vestibulum neque commodo. Nulla sit amet mi vitae eros sodales bibendum at iaculis eros. Pellentesque eget molestie ligula. Mauris lobortis nibh ac neque bibendum, sit amet interdum nisi posuere. Maecenas ac tristique elit, sit amet efficitur ante. Nullam vehicula ex dui, eu pellentesque ante ultrices blandit. Vestibulum non faucibus lectus. Fusce convallis justo eget justo elementum, vel ultrices metus ornare. Pellentesque elementum ex vel lorem tempor, ac congue nisl semper. Fusce sit amet risus vitae mi condimentum dictum at et urna. ',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Nunc at malesuada ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.",
          'resume':
              'Integer mollis dui non efficitur tempor. Duis dignissim arcu at erat commodo, quis ullamcorper neque mollis. Cras placerat ultricies viverra. Donec a luctus lectus. Vivamus a rhoncus elit. Suspendisse felis eros, vehicula vel vehicula quis, pulvinar sit amet enim. Orci varius natoque penatibus et magnis dis parturient montes.',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Sed quis est eros. Curabitur tempor vel turpis non semper.",
          'resume':
              'Proin ex lorem, mattis a rutrum nec, sodales id libero. Nam aliquam eros lacus, eget facilisis lorem dictum a. Nam a massa vitae purus porta sagittis vel ac arcu. Morbi aliquet tellus eget tincidunt interdum. Sed egestas quis ante ac luctus. Integer nunc tellus, mattis id maximus eget, varius vel mi. Donec eu maximus metus.',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing.',
          'resume':
              'Sed rutrum nisi ut augue tincidunt, id vestibulum neque commodo. Nulla sit amet mi vitae eros sodales bibendum at iaculis eros. Pellentesque eget molestie ligula. Mauris lobortis nibh ac neque bibendum, sit amet interdum nisi posuere. Maecenas ac tristique elit, sit amet efficitur ante. Nullam vehicula ex dui, eu pellentesque ante ultrices blandit. Vestibulum non faucibus lectus. Fusce convallis justo eget justo elementum, vel ultrices metus ornare. Pellentesque elementum ex vel lorem tempor, ac congue nisl semper. Fusce sit amet risus vitae mi condimentum dictum at et urna. ',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': 'Maecenas consectetur magna a scelerisque tempor. Mauris consequat ut urna.',
          'resume':
              'Nunc ac orci eget purus sollicitudin condimentum at sed mi. Ut hendrerit nec lorem eu ullamcorper. Nulla in auctor felis, vitae pellentesque tellus. Vivamus dictum finibus turpis sit amet egestas. Ut vitae neque sed massa posuere varius eu ornare odio. Aenean eleifend tellus a orci posuere vulputate. Fusce vitae fermentum est. Duis in facilisis enim, et venenatis erat. Vivamus id justo commodo, dictum metus at, porta enim. Integer venenatis metus at quam accumsan, eu vulputate nulla venenatis. Maecenas non iaculis lectus. ',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Etiam cursus eu libero iaculis tincidunt. Etiam in lacus id lectus elementum tempor.",
          'resume':
              'Sed rutrum nisi ut augue tincidunt, id vestibulum neque commodo. Nulla sit amet mi vitae eros sodales bibendum at iaculis eros. Pellentesque eget molestie ligula. Mauris lobortis nibh ac neque bibendum, sit amet interdum nisi posuere. Maecenas ac tristique elit, sit amet efficitur ante. Nullam vehicula ex dui, eu pellentesque ante ultrices blandit. Vestibulum non faucibus lectus. Fusce convallis justo eget justo elementum, vel ultrices metus ornare. Pellentesque elementum ex vel lorem tempor, ac congue nisl semper. Fusce sit amet risus vitae mi condimentum dictum at et urna. ',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Nunc at malesuada ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae.",
          'resume':
              'Integer mollis dui non efficitur tempor. Duis dignissim arcu at erat commodo, quis ullamcorper neque mollis. Cras placerat ultricies viverra. Donec a luctus lectus. Vivamus a rhoncus elit. Suspendisse felis eros, vehicula vel vehicula quis, pulvinar sit amet enim. Orci varius natoque penatibus et magnis dis parturient montes.',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
        {
          'id': uuid.v4(),
          'title': "Sed quis est eros. Curabitur tempor vel turpis non semper.",
          'resume':
              'Proin ex lorem, mattis a rutrum nec, sodales id libero. Nam aliquam eros lacus, eget facilisis lorem dictum a. Nam a massa vitae purus porta sagittis vel ac arcu. Morbi aliquet tellus eget tincidunt interdum. Sed egestas quis ante ac luctus. Integer nunc tellus, mattis id maximus eget, varius vel mi. Donec eu maximus metus.',
          'image_url': 'https://picsum.photos/200/300',
          'created': '1969-07-20 20:18:04Z',
        },
      ],
    );

    return response.data;
  }
}
