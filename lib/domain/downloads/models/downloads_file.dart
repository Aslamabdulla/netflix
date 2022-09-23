import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads_file.freezed.dart';
part 'downloads_file.g.dart';

@freezed
class Downloads with _$Downloads {
  const factory Downloads({
    @JsonKey(name: "backdrop_path") required String? backdropPath,
    @JsonKey(name: "poster_path") required String? posterPath,
    @JsonKey(name: "title") required String? title,
  }) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
