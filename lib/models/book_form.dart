import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:elibrary/services/parser/date_and_time_parser.dart';

part 'book_form.g.dart';

@JsonSerializable()
class BookForm {
  int? id;
  String? name;
  String? isbn;
  String? description;
  String? publisher;
  String? author;
  @JsonKey(
      fromJson: DateHelper.dateTimeFromJson,
      toJson: DateHelper.dateTimeToJson,
      name: "publishedYear")
  DateTime? publishedDate;
  String? language;
  List<String>? genres;
  @JsonKey(includeToJson: false, includeFromJson: false)
  XFile? image;
  @JsonKey(includeToJson: false, includeFromJson: false)
  String? imageLink;
  MultipartFile? file;
  BookForm({
    this.id,
    this.name,
    this.isbn,
    this.description,
    this.publisher,
    this.author,
    this.publishedDate,
    this.language,
    this.genres,
    this.image,
    this.imageLink,
    this.file,
  });

  BookForm copyWith({
    int? id,
    String? name,
    String? isbn,
    String? description,
    String? publisher,
    String? author,
    DateTime? publishedDate,
    String? language,
    List<String>? genres,
    XFile? image,
    String? imageLink,
    MultipartFile? file,
  }) {
    return BookForm(
      id: id ?? this.id,
      name: name ?? this.name,
      isbn: isbn ?? this.isbn,
      description: description ?? this.description,
      publisher: publisher ?? this.publisher,
      author: author ?? this.author,
      publishedDate: publishedDate ?? this.publishedDate,
      language: language ?? this.language,
      genres: genres ?? this.genres,
      image: image ?? this.image,
      imageLink: imageLink ?? this.imageLink,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toJson() => _$BookFormToJson(this);

  factory BookForm.fromJson(Map<String, dynamic> json) => _$BookFormFromJson(json);

  @override
  String toString() {
    return 'BookForm(id: $id, name: $name, isbn: $isbn, description: $description, publisher: $publisher, author: $author, publishedDate: $publishedDate, language: $language, genres: $genres, image: $image, imageLink: $imageLink, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookForm &&
        other.id == id &&
        other.name == name &&
        other.isbn == isbn &&
        other.description == description &&
        other.publisher == publisher &&
        other.author == author &&
        other.publishedDate == publishedDate &&
        other.language == language &&
        listEquals(other.genres, genres) &&
        other.image == image &&
        other.imageLink == imageLink &&
        other.file == file;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        isbn.hashCode ^
        description.hashCode ^
        publisher.hashCode ^
        author.hashCode ^
        publishedDate.hashCode ^
        language.hashCode ^
        genres.hashCode ^
        image.hashCode ^
        imageLink.hashCode ^
        file.hashCode;
  }
}
