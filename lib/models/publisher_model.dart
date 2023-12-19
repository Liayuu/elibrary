import 'package:json_annotation/json_annotation.dart';

part 'publisher_model.g.dart';

@JsonSerializable()
class PublisherModel {
  int? id;
  @JsonKey(name: "name")
  String? publisherName;
  PublisherModel({
    this.id,
    this.publisherName,
  });

  PublisherModel copyWith({
    int? id,
    String? publisherName,
  }) {
    return PublisherModel(
      id: id ?? this.id,
      publisherName: publisherName ?? this.publisherName,
    );
  }

  Map<String, dynamic> toJson() => _$PublisherModelToJson(this);

  factory PublisherModel.fromJson(Map<String, dynamic> json) => _$PublisherModelFromJson(json);

  @override
  String toString() => 'PublisherModel(id: $id, publisherName: $publisherName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PublisherModel && other.id == id && other.publisherName == publisherName;
  }

  @override
  int get hashCode => id.hashCode ^ publisherName.hashCode;
}
