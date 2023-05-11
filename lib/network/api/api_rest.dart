import 'package:dio/dio.dart';
import 'dart:io';

import '../exception/dio_exception.dart';

class ApiRest {
  static final Dio _dio = Dio();

  static void configureDio() {
    //_dio.options.baseUrl = 'https://app.tiquepos2.com/api';
    _dio.options.baseUrl = 'http://172.16.2.32:8000/api';
    // _dio.options.baseUrl = 'http://192.168.101.10:8000/api';

    _dio.options.connectTimeout = 10000; //10s
    _dio.options.receiveTimeout = 7000;

    _dio.options.headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
  }

  static Future<dynamic> login(Map<String, dynamic> payload,
      {CancelToken? cancelToken}) async {
    try {
      final Response response = await _dio.post(
        "/login",
        data: payload,
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      return {
        "type": DioException.fromDioError(e).getType(),
        "message": DioException.fromDioError(e).toString()
      };
    } on Exception {
      return "Algo salió mal, intente en un par de minutos.";
    }
  }

  static Future<dynamic> logout(String token,
      {CancelToken? cancelToken}) async {
    try {
      final Response response = await _dio.delete(
        "/logout",
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      return {
        "type": DioException.fromDioError(e).getType(),
        "message": DioException.fromDioError(e).toString()
      };
    } on Exception {
      return "Algo salió mal, intente en un par de minutos.";
    }
  }

  static Future<dynamic> validtoken(String token,
      {CancelToken? cancelToken}) async {
    try {
      final Response response = await _dio.get(
        "/validtoken",
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      return {
        "type": DioException.fromDioError(e).getType(),
        "message": DioException.fromDioError(e).toString()
      };
    } on Exception {
      return "Algo salió mal, intente en un par de minutos.";
    }
  }

  static Future<dynamic> contribuyente(String token,
      {CancelToken? cancelToken}) async {
    try {
      final Response response = await _dio.get(
        "/contribuyente",
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      return {
        "type": DioException.fromDioError(e).getType(),
        "message": DioException.fromDioError(e).toString()
      };
    } on Exception {
      return "Algo salió mal, intente en un par de minutos.";
    }
  }

  static Future<dynamic> lista(Map<String, dynamic> payload, String token,
      {CancelToken? cancelToken}) async {
    try {
      final Response response = await _dio.get(
        "/lista",
        queryParameters: payload,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      return {
        "type": DioException.fromDioError(e).getType(),
        "message": DioException.fromDioError(e).toString()
      };
    } on Exception {
      return "Algo salió mal, intente en un par de minutos.";
    }
  }
}
