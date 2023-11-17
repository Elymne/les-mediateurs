// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:les_mediateurs/domain/models/content/enum_content_type.dart';

part 'reduced_content.freezed.dart';
part 'reduced_content.g.dart';

@freezed
class ReducedContent with _$ReducedContent {
  const factory ReducedContent({
    required String id,
    required String title,
    @JsonKey(name: 'content_type') required ContentType contentType,
    required String description,
    @JsonKey(name: 'thumbnail_url') required String thumbnailUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ReducedContent;

  factory ReducedContent.fromJson(Map<String, Object?> json) => _$ReducedContentFromJson(json);
}
