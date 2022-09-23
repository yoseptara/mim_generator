// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'meme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemeModel _$MemeModelFromJson(Map<String, dynamic> json) {
  return _MemeModel.fromJson(json);
}

/// @nodoc
mixin _$MemeModel {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'box_count')
  int get boxCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemeModelCopyWith<MemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeModelCopyWith<$Res> {
  factory $MemeModelCopyWith(MemeModel value, $Res Function(MemeModel) then) =
      _$MemeModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? name,
      String? url,
      int width,
      int height,
      @JsonKey(name: 'box_count') int boxCount});
}

/// @nodoc
class _$MemeModelCopyWithImpl<$Res> implements $MemeModelCopyWith<$Res> {
  _$MemeModelCopyWithImpl(this._value, this._then);

  final MemeModel _value;
  // ignore: unused_field
  final $Res Function(MemeModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? boxCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      boxCount: boxCount == freezed
          ? _value.boxCount
          : boxCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_MemeModelCopyWith<$Res> implements $MemeModelCopyWith<$Res> {
  factory _$$_MemeModelCopyWith(
          _$_MemeModel value, $Res Function(_$_MemeModel) then) =
      __$$_MemeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? name,
      String? url,
      int width,
      int height,
      @JsonKey(name: 'box_count') int boxCount});
}

/// @nodoc
class __$$_MemeModelCopyWithImpl<$Res> extends _$MemeModelCopyWithImpl<$Res>
    implements _$$_MemeModelCopyWith<$Res> {
  __$$_MemeModelCopyWithImpl(
      _$_MemeModel _value, $Res Function(_$_MemeModel) _then)
      : super(_value, (v) => _then(v as _$_MemeModel));

  @override
  _$_MemeModel get _value => super._value as _$_MemeModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? boxCount = freezed,
  }) {
    return _then(_$_MemeModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      boxCount: boxCount == freezed
          ? _value.boxCount
          : boxCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemeModel implements _MemeModel {
  const _$_MemeModel(
      {required this.id,
      this.name,
      this.url,
      this.width = 0,
      this.height = 0,
      @JsonKey(name: 'box_count') this.boxCount = 0});

  factory _$_MemeModel.fromJson(Map<String, dynamic> json) =>
      _$$_MemeModelFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? url;
  @override
  @JsonKey()
  final int width;
  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey(name: 'box_count')
  final int boxCount;

  @override
  String toString() {
    return 'MemeModel(id: $id, name: $name, url: $url, width: $width, height: $height, boxCount: $boxCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemeModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.boxCount, boxCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(boxCount));

  @JsonKey(ignore: true)
  @override
  _$$_MemeModelCopyWith<_$_MemeModel> get copyWith =>
      __$$_MemeModelCopyWithImpl<_$_MemeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemeModelToJson(
      this,
    );
  }
}

abstract class _MemeModel implements MemeModel {
  const factory _MemeModel(
      {required final String id,
      final String? name,
      final String? url,
      final int width,
      final int height,
      @JsonKey(name: 'box_count') final int boxCount}) = _$_MemeModel;

  factory _MemeModel.fromJson(Map<String, dynamic> json) =
      _$_MemeModel.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get url;
  @override
  int get width;
  @override
  int get height;
  @override
  @JsonKey(name: 'box_count')
  int get boxCount;
  @override
  @JsonKey(ignore: true)
  _$$_MemeModelCopyWith<_$_MemeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
