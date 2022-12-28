import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EliminarUsuarioCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    final body = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'eliminarUsuario',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/eliminarPesador',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ObtenerMaterialesCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) {
    final body = '''
{
  "material": "${material}",
  "pedido": "${pedido}",
  "cantidad": "${cantidad}",
  "token": "${token}",
  "tipo": "${tipo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'nuevoPedido',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/nuevo_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DetallePedidoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FinalizarPedidoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
    String? nombre = '',
    String? email = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HistorialCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    final body = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Historial',
      apiUrl: 'https://tuticket.scrapolis.mx/apituticket/api/historial_pedidos',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HistorialDetalleCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pedido = '',
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  }) {
    final body = '''
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
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
