import 'package:appsauri/model/usuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../network/api/api_rest.dart';

class AppProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSignout = true;
  Usuario usuario = Usuario();
  Brightness brightness = Brightness.dark;

  AppProvider();

  Future<dynamic> login(Map<String, dynamic> payload,
      {CancelToken? cancelToken}) async {
    return await ApiRest.login(payload, cancelToken: cancelToken);
  }

  Future<dynamic> logout({CancelToken? cancelToken}) async {
    return await ApiRest.logout(usuario.token!, cancelToken: cancelToken);
  }

  Future<dynamic> validtoken({CancelToken? cancelToken}) async {
    return await ApiRest.validtoken(usuario.token!, cancelToken: cancelToken);
  }

  Future<dynamic> contribuyente({CancelToken? cancelToken}) async {
    return await ApiRest.contribuyente(usuario.token!,
        cancelToken: cancelToken);
  }

  Future<dynamic> lista(Map<String, dynamic> payload,
      {CancelToken? cancelToken}) async {
    return await ApiRest.lista(payload, usuario.token!,
        cancelToken: cancelToken);
  }
}
