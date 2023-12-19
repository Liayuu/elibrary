import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:elibrary/models/publisher_model.dart';
import 'package:elibrary/models/writer_model.dart';
import 'package:elibrary/services/parser/date_and_time_parser.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  int? id;
  String? name;
  String? isbn;
  String? description;
  List<String>? genres;
  PublisherModel? publisher;
  @JsonKey(name: "author")
  WriterModel? writer;
  String? language;
  @JsonKey(
    name: "publishedYear",
    fromJson: DateHelper.dateTimeFromJson,
    toJson: DateHelper.dateTimeToJson,
  )
  DateTime? publishedDate;
  BookModel({
    this.id,
    this.name,
    this.isbn,
    this.description,
    this.genres,
    this.publisher,
    this.writer,
    this.language,
    this.publishedDate,
  });

  BookModel copyWith({
    int? id,
    String? name,
    String? isbn,
    String? description,
    List<String>? genres,
    PublisherModel? publisher,
    WriterModel? writer,
    String? language,
    DateTime? publishedDate,
  }) {
    return BookModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isbn: isbn ?? this.isbn,
      description: description ?? this.description,
      genres: genres ?? this.genres,
      publisher: publisher ?? this.publisher,
      writer: writer ?? this.writer,
      language: language ?? this.language,
      publishedDate: publishedDate ?? this.publishedDate,
    );
  }

  Map<String, dynamic> toJson() => _$BookModelToJson(this);

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);

  @override
  String toString() {
    return 'BookModel(id: $id, name: $name, isbn: $isbn, description: $description, genres: $genres, publisher: $publisher, writer: $writer, language: $language, publishedDate: $publishedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.id == id &&
        other.name == name &&
        other.isbn == isbn &&
        other.description == description &&
        listEquals(other.genres, genres) &&
        other.publisher == publisher &&
        other.writer == writer &&
        other.language == language &&
        other.publishedDate == publishedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        isbn.hashCode ^
        description.hashCode ^
        genres.hashCode ^
        publisher.hashCode ^
        writer.hashCode ^
        language.hashCode ^
        publishedDate.hashCode;
  }
}
