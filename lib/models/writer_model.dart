import 'package:json_annotation/json_annotation.dart';

part 'writer_model.g.dart';

@JsonSerializable()
class WriterModel {
  String? id;
  String? writerName;
  WriterModel({
    this.id,
    this.writerName,
  });

  WriterModel copyWith({
    String? id,
    String? writerName,
  }) {
    return WriterModel(
      id: id ?? this.id,
      writerName: writerName ?? this.writerName,
    );
  }

  Map<String, dynamic> toJson() => _$WriterModelToJson(this);

  factory WriterModel.fromJson(Map<String, dynamic> json) =>
      _$WriterModelFromJson(json);

  @override
  String toString() => 'WriterModel(id: $id, writerName: $writerName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WriterModel &&
        other.id == id &&
        other.writerName == writerName;
  }

  @override
  int get hashCode => id.hashCode ^ writerName.hashCode;
}
