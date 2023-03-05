import 'package:dio/dio.dart';

class DioException implements Exception {
  late DioErrorType type;
  late String message;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        type = dioError.type;
        message = "Se canceló la solicitud al servidor API";
        break;
      case DioErrorType.connectTimeout:
        type = dioError.type;
        message =
            "Se termino el tiempo de espera de conexión con el servidor API";
        break;
      case DioErrorType.receiveTimeout:
        type = dioError.type;
        message =
            "Tiempo de espera de recepción en conexión con el servidor API";
        break;
      case DioErrorType.response:
        type = dioError.type;
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        type = dioError.type;
        message = "Enviar tiempo de espera en conexión con el servidor API";
        break;
      case DioErrorType.other:
        type = dioError.type;
        if (dioError.message.contains("SocketException")) {
          message = 'Sin internet';
          break;
        }
        message = "Ocurrió un error inesperado";
        break;
      default:
        message = "Algo salió mal";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'];
      case 401:
        return 'Unauthorized';
      case 403:
        return error['message'];
      case 404:
        return error['message']; //Not found
      case 500:
        return error['message'];
      case 502:
        return 'Bad gateway';
      default:
        return 'Huy! Algo salió mal';
    }
  }

  DioErrorType getType() {
    return type;
  }

  @override
  String toString() => message;
}
