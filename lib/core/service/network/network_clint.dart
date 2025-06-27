import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part 'network_respons.dart';

class NetworkClint {
  final Logger _logger = Logger();
  final VoidCallback onUnAuthoriz;
  final String _dfoldMassage = 'SomeThink went Wrong';
  Map<String, String> commonHaders;
  NetworkClint({required this.onUnAuthoriz, required this.commonHaders});

  Future<NetworkRespons> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHaders);
      final Response response = await get(uri, headers: commonHaders);
      _logRespons(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: true,
            statusCode: response.statusCode,
            responsData: responsBody);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        onUnAuthoriz;
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: 'Un-Authoriz');
      } else {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            responsData: responsBody['msg'] ?? _dfoldMassage);
      }
    } catch (e) {
      return NetworkRespons(
          isSuccess: false, statusCode: -1, errorMassage: e.toString());
    }
  }

  Future<NetworkRespons> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHaders);
      final Response response =
          await post(uri, headers: commonHaders, body: jsonEncode(body));
      _logRespons(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: true,
            statusCode: response.statusCode,
            responsData: responsBody);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        onUnAuthoriz;
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: 'Un-Authoriz');
      } else {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: responsBody['msg'] ?? _dfoldMassage);
      }
    } catch (e) {
      return NetworkRespons(
          isSuccess: false, statusCode: -1, errorMassage: e.toString());
    }
  }

  Future<NetworkRespons> putRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHaders);
      final Response response =
          await put(uri, headers: commonHaders, body: jsonEncode(body));
      _logRespons(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: true,
            statusCode: response.statusCode,
            responsData: responsBody);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        onUnAuthoriz;
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: 'Un-Authoriz');
      } else {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: responsBody['msg'] ?? _dfoldMassage);
      }
    } catch (e) {
      return NetworkRespons(
          isSuccess: false, statusCode: -1, errorMassage: e.toString());
    }
  }

  Future<NetworkRespons> patchRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHaders);
      final Response response =
          await patch(uri, headers: commonHaders, body: jsonEncode(body));
      _logRespons(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: true,
            statusCode: response.statusCode,
            responsData: responsBody);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        onUnAuthoriz;
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: 'Un-Authoriz');
      } else {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: responsBody['msg'] ?? _dfoldMassage);
      }
    } catch (e) {
      return NetworkRespons(
          isSuccess: false, statusCode: -1, errorMassage: e.toString());
    }
  }

  Future<NetworkRespons> deleteRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, header: commonHaders);
      final Response response =
          await delete(uri, headers: commonHaders, body: jsonEncode(body));
      _logRespons(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: true,
            statusCode: response.statusCode,
            responsData: responsBody);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        onUnAuthoriz;
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: 'Un-Authoriz');
      } else {
        final responsBody = jsonDecode(response.body);
        return NetworkRespons(
            isSuccess: false,
            statusCode: response.statusCode,
            errorMassage: responsBody['msg'] ?? _dfoldMassage);
      }
    } catch (e) {
      return NetworkRespons(
          isSuccess: false, statusCode: -1, errorMassage: e.toString());
    }
  }

  void _logRequest(String url,
      {Map<String, String>? header, Map<String, dynamic>? body}) {
    final String massage = '''
    URL => $url,
    HEADER =>$header,
    BODY => $body
    ''';
    _logger.i(massage);
  }

  void _logRespons(Response respons) {
    final String massage = '''
    URL => ${respons.request?.url},
    STATUS CODE =>${respons.statusCode},
    HEADER =>${respons.request?.headers},
    BODY => ${respons.body},
    ''';
    _logger.i(massage);
  }
}
