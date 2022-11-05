import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_screen.freezed.dart';
part 'home_screen.g.dart';

@freezed
class HomeScreen with _$HomeScreen {
  const factory HomeScreen({
    @JsonKey(name: "poster_path") required String? posterPath,
  }) = _HomeScreen;

  factory HomeScreen.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenFromJson(json);
}
