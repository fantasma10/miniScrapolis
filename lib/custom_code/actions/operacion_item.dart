// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert' as convert;

Future<dynamic> operacionItem(
  bool tipo,
  double valor,
  String idMaterial,
) async {
  var url = Uri.parse(FFAppState().urlNuevoPedido);
  if (tipo) {
    var response = await http.post(url, body: {
      'material': idMaterial,
      'pedido': FFAppState().idPedido,
      'cantidad': 1,
      'token': FFAppState().tokenUsuarioApp,
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      return response.body;
    }
  } else {
    var response = await http.post(url, body: {
      'material': idMaterial,
      'pedido': FFAppState().idPedido,
      'cantidad': -1,
      'token': FFAppState().tokenUsuarioApp,
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      return response.body;
    }
  }
}
