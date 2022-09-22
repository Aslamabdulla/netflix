import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads_file.freezed.dart';
part 'downloads_file.g.dart';

@freezed
class Downloads with _$Downloads {
  const factory Downloads({
    @JsonKey(name: "poster_path") required String? posterPath,
  }) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
