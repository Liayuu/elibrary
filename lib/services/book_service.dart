import 'dart:developer';

import 'package:elibrary/models/book_model.dart';
import 'package:elibrary/services/parser/links.dart';
import 'package:get/get.dart';

class BookService extends GetConnect {
  static const String host = "192.168.1.18";
  static const String port = ":8080";
  static const String mainPath = "/e-library/api";
  static const String servicePath = "$mainPath/book";

  static const jpegType = 'image/jpeg';
  static const pngType = 'image/png';
  static const gifType = 'image/gif';
  static const videoType = 'video/mp4';
  static const octetStreamType = 'application/octet-stream';

  Future<BookModel> getBook(int id) async {
    return await get(getHttpUriEndpoint("$host$port", "$servicePath/$id").toString()).then((value) {
      if (responseChecker(value)) {
        return BookModel.fromJson(value.body);
      } else {
        throw "Error get book ${value.statusCode} ${value.body}";
      }
    }).catchError((e) => throw e.toString());
  }

  Future<List<BookModel>> getAllBook() async {
    return await get(getHttpUriEndpoint("$host$port", servicePath).toString()).then((value) {
      log(value.body.toString());
      if (responseChecker(value)) {
        return List<BookModel>.from(value.body.map((e) => BookModel.fromJson(e)));
      } else {
        throw "Error get book list ${value.statusCode} ${value.body}";
      }
    }).catchError((e) => throw e.toString());
  }

  Future<BookModel> addingImage(FormData data, int id) async {
    return await post(getHttpUriEndpoint("$host$port", "$servicePath/image/$id").toString(), data)
        .then((value) {
      log(data.files.toString());
      if (responseChecker(value)) {
        return BookModel.fromJson(value.body);
      } else {
        throw "Error input image ${value.statusCode} ${value.body}";
      }
    }).catchError((e) => throw e.toString());
  }

  Future<BookModel> createBook(dynamic form) async {
    return await post(
      getHttpUriEndpoint("$host$port", servicePath).toString(),
      form,
    ).then((value) {
      if (responseChecker(value)) {
        return BookModel.fromJson(value.body);
      } else {
        throw "Error create book ${value.statusCode} ${value.body}";
      }
    }).catchError((e) => throw e.toString());
  }

  Future<BookModel> updateBook(dynamic form, int id) async {
    return await put(getHttpUriEndpoint("$host$port", "$servicePath/$id").toString(), form)
        .then((value) {
      if (responseChecker(value)) {
        return BookModel.fromJson(value.body);
      } else {
        throw "Error update book ${value.statusCode} ${value.body}";
      }
    }).catchError((e) => throw e.toString());
  }

  Future<int?> deleteBook(int id) async {
    return await delete(getHttpUriEndpoint("$host$port", "$servicePath/$id").toString())
        .then((value) {
      if (responseChecker(value)) {
        return value.statusCode;
      } else {
        throw "Error delete book ${value.statusCode} ${value.body}";
      }
    }).catchError((e) => throw e.toString());
  }

  String imageUrl(int id) {
    return getHttpUriEndpoint("$host$port", "$servicePath/image/$id").toString();
  }

  String getContentType(String fileName) {
    var split = fileName.split(".");
    if (split.isEmpty || split.length <= 1) {
      throw "NoExtensionFound";
    }

    var extension = split.last;
    switch (extension) {
      case 'jpg':
        return jpegType;
      case 'jpeg':
        return jpegType;
      case 'png':
        return pngType;
      case 'gif':
        return gifType;
      case 'mp4':
        return videoType;
      default:
        return octetStreamType;
    }
  }
}
