// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:les_mediateurs/domain/models/content/enum_content_type.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String id,
    required String title,
    required ContentType contentType,
    required String description,
    @JsonKey(name: 'main_img_url') required String mainImgUrl,
    required String markdown,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) => _$ArticleFromJson(json);
}
