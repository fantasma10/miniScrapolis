import 'dart:convert';

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
      apiUrl:
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      apiUrl:
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/eliminarPesador',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/obtener_materiales',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      apiUrl:
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/nuevo_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      apiUrl:
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/detalle_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      apiUrl:
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/finalizar_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
      apiUrl:
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/historial_pedidos',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/historial_detalle_pedido',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
          'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/auth/registrar_pesador',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
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
