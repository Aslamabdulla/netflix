import 'package:json_annotation/json_annotation.dart';
part 'downloads_file.freezed.dart';
part 'downloads_file.g.dart';

@freezed
class Downloads with _$Downloads {
  const factory Downloads() = _Downloads;
@JsonKey(name: "poster_path") required String? posterPath;
  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
