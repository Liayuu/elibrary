import 'package:flutter/material.dart';
import 'package:get/get.dart';

//change the value with your domain and path
// const String domain = "103.226.139.177";
const String domain = "192.168.1.20";
const String userPort = ':8021';
const String merchantPort = ':8022';
const String inventoryPort = ':8025';
const String productPort = ':8023';
const String staticPath = "/api/v1";

Uri getHttpsUriEndpoint(String authority, String unencodedPath,
    [Map<String, dynamic>? queryParam]) {
  return Uri.https(authority, unencodedPath, queryParam);
}

Uri getHttpUriEndpoint(String authority, String unencodedPath, [Map<String, dynamic>? queryParam]) {
  return Uri.http(authority, unencodedPath, queryParam);
}

bool responseChecker(Response<dynamic> value) {
  if (value.isOk && value.body != null && value.body != "null") {
    return true;
  }
  return false;
}

Map<String, String> getStringMappedParam(Map<String, dynamic> param) {
  param.removeWhere((key, value) => value == null);
  return param.map((key, value) => MapEntry(key, value!.toString()));
}

String htmlParserToText(String text) {
  return text.replaceAll("(?s)<(\\w+)\\b[^<>]*>.*?</\\1>", "");
}

Widget snapshotChecker(AsyncSnapshot snapshot,
    {required Widget mainWidget, Widget? loadingWidget, Widget? failedWidget}) {
  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
    return mainWidget;
  } else if (snapshot.connectionState == ConnectionState.waiting) {
    return loadingWidget ??
        const Center(
          child: CircularProgressIndicator(),
        );
  } else {
    return failedWidget ?? const SizedBox();
  }
}
