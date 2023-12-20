import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  int? id;
  String? name;
  GenreModel({
    this.id,
    this.name,
  });

  GenreModel copyWith({
    int? id,
    String? name,
  }) {
    return GenreModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);

  @override
  String toString() => 'GenreModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenreModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
