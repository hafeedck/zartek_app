import 'dart:convert';
import 'dart:io';
import 'package:machine_test_zartek/app/data/network/base_api_services.dart';
import 'package:machine_test_zartek/app/data/user_preference/user_prefrence_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(
    String url,
  ) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;

    try {
      final value = await UserPreference().getUser();

      final headers = {
        HttpHeaders.authorizationHeader: "Bearer ${value!.encKey}",
      };

      final response = await http
          .get(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(
            const Duration(seconds: 10),
          );

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      // print(responseJson);
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(
    var data,
    dynamic url,
  ) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final value = await UserPreference().getUser();

      final headers = {
        HttpHeaders.authorizationHeader: "Bearer ${value!.encKey}",
      };
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));
      // print(value.encKey);
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      //  print(responseJson);
    }
    return responseJson;
  }

  Future<dynamic> uploadFile(
    dynamic url,
    String type,
    String filePath,
  ) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll({'type': type});
      request.files.add(await http.MultipartFile.fromPath(
        'file',
        filePath,
      ));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        responseJson = jsonDecode(await response.stream.bytesToString());

        return responseJson;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
      }
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);

        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 403:
        final userPreference = UserPreference();
        await userPreference.removeUser();
        userPreference.goToSplash();

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ${response.statusCode}');
    }
  }

  @override
  Future loginApi(data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      //  print(responseJson);
    }
    return responseJson;
  }
}
