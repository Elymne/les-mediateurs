// ignore_for_file: invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:les_mediateurs/domain/models/content/enum_content_type.dart';

part 'trending.freezed.dart';
part 'trending.g.dart';

@freezed
class Trending with _$Trending {
  const factory Trending({
    required String id,
    required String title,
    @JsonKey(name: 'content_type') required ContentType contentType,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Trending;

  factory Trending.fromJson(Map<String, Object?> json) => _$TrendingFromJson(json);
}
