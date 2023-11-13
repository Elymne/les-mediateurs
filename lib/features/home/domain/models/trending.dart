import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending.freezed.dart';
part 'trending.g.dart';

@freezed
class Trending with _$Trending {
  const factory Trending({
    required String id,
    required String title,
    required String type,
    required DateTime created,
  }) = _Trending;

  factory Trending.fromJson(Map<String, Object?> json) => _$TrendingFromJson(json);
}
