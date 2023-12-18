// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: json['id'] as String?,
      book: json['book'] as String?,
      description: json['description'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] == null
          ? null
          : PublisherModel.fromJson(json['publisher'] as Map<String, dynamic>),
      writer: json['writer'] == null
          ? null
          : WriterModel.fromJson(json['writer'] as Map<String, dynamic>),
      language: json['language'] as String?,
      publishedDate: json['publishedDate'] == null
          ? null
          : DateTime.parse(json['publishedDate'] as String),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'book': instance.book,
      'description': instance.description,
      'genres': instance.genres,
      'publisher': instance.publisher,
      'writer': instance.writer,
      'language': instance.language,
      'publishedDate': instance.publishedDate?.toIso8601String(),
    };
