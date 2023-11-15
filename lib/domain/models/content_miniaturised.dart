// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_miniaturised.freezed.dart';
part 'content_miniaturised.g.dart';

@freezed
class ContentMiniaturised with _$ContentMiniaturised {
  const factory ContentMiniaturised({
    required String id,
    required String title,
    required String resume,
    @JsonKey(name: 'image_url') required String imageUrl,
    required DateTime created,
  }) = _ContentMiniaturised;

  factory ContentMiniaturised.fromJson(Map<String, Object?> json) => _$ContentMiniaturisedFromJson(json);
}
