import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'home_screen_json.g.dart';

@JsonSerializable()
class HomeScreenJson {
  int? page;
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  HomeScreenJson({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory HomeScreenJson.fromJson(Map<String, dynamic> json) {
    return _$HomeScreenJsonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeScreenJsonToJson(this);
}
