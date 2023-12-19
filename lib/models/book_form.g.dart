// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookForm _$BookFormFromJson(Map<String, dynamic> json) => BookForm(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isbn: json['isbn'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      author: json['author'] as String?,
      publishedDate:
          DateHelper.dateTimeFromJson(json['publishedYear'] as String?),
      language: json['language'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookFormToJson(BookForm instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isbn': instance.isbn,
      'description': instance.description,
      'publisher': instance.publisher,
      'author': instance.author,
      'publishedYear': DateHelper.dateTimeToJson(instance.publishedDate),
      'language': instance.language,
      'genres': instance.genres,
    };
