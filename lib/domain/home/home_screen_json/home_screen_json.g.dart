// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenJson _$HomeScreenJsonFromJson(Map<String, dynamic> json) =>
    HomeScreenJson(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$HomeScreenJsonToJson(HomeScreenJson instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
