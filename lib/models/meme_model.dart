import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_model.freezed.dart';
part 'meme_model.g.dart';

@freezed
class MemeModel with _$MemeModel {
  const factory MemeModel({
    required String id,
    String? name,
    String? url,
    @Default(0) int width,
    @Default(0) int height,
    @JsonKey(name: 'box_count')
    @Default(0) int boxCount,
}) = _MemeModel;

  factory MemeModel.fromJson(Map<String, dynamic> json) => _$MemeModelFromJson(json);
 // Map<String, dynamic> toJson() => _$MemeModelToJson(this);
}