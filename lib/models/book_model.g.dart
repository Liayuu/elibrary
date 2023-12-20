// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isbn: json['isbn'] as String?,
      description: json['description'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      publisher: json['publisher'] == null
          ? null
          : PublisherModel.fromJson(json['publisher'] as Map<String, dynamic>),
      writer: json['author'] == null
          ? null
          : WriterModel.fromJson(json['author'] as Map<String, dynamic>),
      language: json['language'] as String?,
      publishedDate:
          DateHelper.dateTimeFromJson(json['publishedYear'] as String?),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isbn': instance.isbn,
      'description': instance.description,
      'genres': instance.genres,
      'publisher': instance.publisher,
      'author': instance.writer,
      'language': instance.language,
      'publishedYear': DateHelper.dateTimeToJson(instance.publishedDate),
    };
