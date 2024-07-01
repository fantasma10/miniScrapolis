import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "usuario": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EliminarUsuarioCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'eliminarUsuario',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/eliminarPesador',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ObtenerMaterialesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "pedido": "${pedido}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'obtenerMateriales',
      apiUrl:
          'https://tuticket.scrapolis.mx/apituticket/api/obtener_materiales',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NuevoPedidoCall {
  static Future<ApiCallResponse> call({
    String? material = '',
    String? pedido = '',
    String? cantidad = '',
    String? token = '',
    String? tipo = '',
    String? tipoOperacion = '',
    String? precio = '',
  }) async {
    final ffApiRequestBody = '''
{
  "material": "${material}",
  "pedido": "${pedido}",
  "cantidad": "${cantidad}",
  "token": "${token}",
  "tipo": "${tipo}",
  "tipo_operacion": "${tipoOperacion}",
  "precio": "${precio}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'nuevoPedido',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/nuevo_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DetallePedidoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "pedido": "${pedido}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'detallePedido',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/detalle_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FinalizarPedidoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
    String? nombre = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "pedido": "${pedido}",
  "nombre": "${nombre}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'finalizarPedido',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/finalizar_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HistorialCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Historial',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/historial_pedidos',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HistorialDetalleCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}",
  "pedido": "${pedido}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HistorialDetalle',
      apiUrl:
          'https://tuticket.scrapolis.mx/apituticket/api/historial_detalle_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegistrarmeCall {
  static Future<ApiCallResponse> call({
    String? nombres = '',
    String? apellidos = '',
    String? email = '',
    String? password = '',
    String? telefono = '',
  }) async {
    final ffApiRequestBody = '''
{
  "nombres": "${nombres}",
  "apellidos": "${apellidos}",
  "email": "${email}",
  "password": "${password}",
  "telefono": "${telefono}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registrarme',
      apiUrl:
          'https://tuticket.scrapolis.mx/apituticket/api/auth/registrar_pesador',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
