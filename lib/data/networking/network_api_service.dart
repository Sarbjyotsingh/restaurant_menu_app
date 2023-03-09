import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:restaurant_menu_app/data/app_exceptions.dart';

/// This class provides methods to perform HTTP GET, POST, PUT and DELETE requests to an API endpoint and returns the response as a JSON object.
class NetworkApiService {
  // ‘_apiTimeoutDuration‘ defines the timeout duration for each API request.
  static const Duration _apiTimeoutDuration = Duration(seconds: 10);

  static final FetchDataException _noInternetConnectionException =
      FetchDataException('No Internet Connection');
  static final _headers = {'Content-Type': 'application/json'};

  /// This method sends an HTTP GET request to the specified URL and returns the response as a JSON object.
  static Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(url);
      final response = await http
          .get(
            uri,
            headers: _headers,
          )
          .timeout(_apiTimeoutDuration);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw _noInternetConnectionException;
    }

    return responseJson;
  }

  /// This method sends an HTTP POST request to the specified URL with the given data and returns the response as a JSON object.
  static Future getPostApiResponse(String url, Object data) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(url);
      final body = jsonEncode(data);
      http.Response response = await http
          .post(
            uri,
            headers: _headers,
            body: body,
          )
          .timeout(_apiTimeoutDuration);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw _noInternetConnectionException;
    }

    return responseJson;
  }

  /// This method sends an HTTP PUT request to the specified URL with the given data and returns the response as a JSON object.
  static Future getPutApiResponse(String url, Object data) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(url);
      final body = jsonEncode(data);
      http.Response response = await http
          .put(
            uri,
            headers: _headers,
            body: body,
          )
          .timeout(_apiTimeoutDuration);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw _noInternetConnectionException;
    }

    return responseJson;
  }

  /// This method sends an HTTP DELETE request to the specified URL with the given data and returns the response as a JSON object.
  static Future getDeleteApiResponse(String url) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(url);
      http.Response response = await http
          .delete(
            uri,
            headers: _headers,
          )
          .timeout(_apiTimeoutDuration);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw _noInternetConnectionException;
    }

    return responseJson;
  }

  // Convert the response body to a JSON object.
  static dynamic _returnResponse(http.Response response) {
    dynamic responseBody = jsonDecode(utf8.decode(response.bodyBytes));
    int statusCode = response.statusCode;

    // handle HTTP status codes and throws an exception if necessary.
    switch (statusCode) {
      case 200:
        return responseBody;
      case 400:
        throw BadRequestException(responseBody);
      case 404:
        throw NotFoundException(responseBody);
      case 500:
        throw InternalServerException(responseBody);

      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code: $statusCode');
    }
  }
}
