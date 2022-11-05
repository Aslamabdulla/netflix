// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeScreen _$HomeScreenFromJson(Map<String, dynamic> json) {
  return _HomeScreen.fromJson(json);
}

/// @nodoc
mixin _$HomeScreen {
  @JsonKey(name: "poster_path")
  String? get posterPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeScreenCopyWith<HomeScreen> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenCopyWith<$Res> {
  factory $HomeScreenCopyWith(
          HomeScreen value, $Res Function(HomeScreen) then) =
      _$HomeScreenCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: "poster_path") String? posterPath});
}

/// @nodoc
class _$HomeScreenCopyWithImpl<$Res> implements $HomeScreenCopyWith<$Res> {
  _$HomeScreenCopyWithImpl(this._value, this._then);

  final HomeScreen _value;
  // ignore: unused_field
  final $Res Function(HomeScreen) _then;

  @override
  $Res call({
    Object? posterPath = freezed,
  }) {
    return _then(_value.copyWith(
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeScreenCopyWith<$Res>
    implements $HomeScreenCopyWith<$Res> {
  factory _$$_HomeScreenCopyWith(
          _$_HomeScreen value, $Res Function(_$_HomeScreen) then) =
      __$$_HomeScreenCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: "poster_path") String? posterPath});
}

/// @nodoc
class __$$_HomeScreenCopyWithImpl<$Res> extends _$HomeScreenCopyWithImpl<$Res>
    implements _$$_HomeScreenCopyWith<$Res> {
  __$$_HomeScreenCopyWithImpl(
      _$_HomeScreen _value, $Res Function(_$_HomeScreen) _then)
      : super(_value, (v) => _then(v as _$_HomeScreen));

  @override
  _$_HomeScreen get _value => super._value as _$_HomeScreen;

  @override
  $Res call({
    Object? posterPath = freezed,
  }) {
    return _then(_$_HomeScreen(
      posterPath: posterPath == freezed
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeScreen implements _HomeScreen {
  const _$_HomeScreen({@JsonKey(name: "poster_path") required this.posterPath});

  factory _$_HomeScreen.fromJson(Map<String, dynamic> json) =>
      _$$_HomeScreenFromJson(json);

  @override
  @JsonKey(name: "poster_path")
  final String? posterPath;

  @override
  String toString() {
    return 'HomeScreen(posterPath: $posterPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeScreen &&
            const DeepCollectionEquality()
                .equals(other.posterPath, posterPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(posterPath));

  @JsonKey(ignore: true)
  @override
  _$$_HomeScreenCopyWith<_$_HomeScreen> get copyWith =>
      __$$_HomeScreenCopyWithImpl<_$_HomeScreen>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeScreenToJson(
      this,
    );
  }
}

abstract class _HomeScreen implements HomeScreen {
  const factory _HomeScreen(
          {@JsonKey(name: "poster_path") required final String? posterPath}) =
      _$_HomeScreen;

  factory _HomeScreen.fromJson(Map<String, dynamic> json) =
      _$_HomeScreen.fromJson;

  @override
  @JsonKey(name: "poster_path")
  String? get posterPath;
  @override
  @JsonKey(ignore: true)
  _$$_HomeScreenCopyWith<_$_HomeScreen> get copyWith =>
      throw _privateConstructorUsedError;
}
