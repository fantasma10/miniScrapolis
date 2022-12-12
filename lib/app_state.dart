import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _usuario = await secureStorage.getString('ff_usuario') ?? _usuario;
    _password = await secureStorage.getString('ff_password') ?? _password;
    _guardaUsuarioPassword =
        await secureStorage.getBool('ff_guardaUsuarioPassword') ??
            _guardaUsuarioPassword;
    _tokenUsuarioApp =
        await secureStorage.getString('ff_tokenUsuarioApp') ?? _tokenUsuarioApp;
    _publicarApp =
        await secureStorage.getString('ff_publicarApp') ?? _publicarApp;
  }

  late FlutterSecureStorage secureStorage;

  String _usuario = '';
  String get usuario => _usuario;
  set usuario(String _value) {
    notifyListeners();

    _usuario = _value;
    secureStorage.setString('ff_usuario', _value);
  }

  void deleteUsuario() {
    notifyListeners();
    secureStorage.delete(key: 'ff_usuario');
  }

  String _password = '';
  String get password => _password;
  set password(String _value) {
    notifyListeners();

    _password = _value;
    secureStorage.setString('ff_password', _value);
  }

  void deletePassword() {
    notifyListeners();
    secureStorage.delete(key: 'ff_password');
  }

  bool _guardaUsuarioPassword = true;
  bool get guardaUsuarioPassword => _guardaUsuarioPassword;
  set guardaUsuarioPassword(bool _value) {
    notifyListeners();

    _guardaUsuarioPassword = _value;
    secureStorage.setBool('ff_guardaUsuarioPassword', _value);
  }

  void deleteGuardaUsuarioPassword() {
    notifyListeners();
    secureStorage.delete(key: 'ff_guardaUsuarioPassword');
  }

  String _tokenUsuarioApp = '';
  String get tokenUsuarioApp => _tokenUsuarioApp;
  set tokenUsuarioApp(String _value) {
    notifyListeners();

    _tokenUsuarioApp = _value;
    secureStorage.setString('ff_tokenUsuarioApp', _value);
  }

  void deleteTokenUsuarioApp() {
    notifyListeners();
    secureStorage.delete(key: 'ff_tokenUsuarioApp');
  }

  String _ocultaOpciones = '';
  String get ocultaOpciones => _ocultaOpciones;
  set ocultaOpciones(String _value) {
    notifyListeners();

    _ocultaOpciones = _value;
  }

  dynamic _listadoMateriales;
  dynamic get listadoMateriales => _listadoMateriales;
  set listadoMateriales(dynamic _value) {
    notifyListeners();

    _listadoMateriales = _value;
  }

  String _idPedido = '';
  String get idPedido => _idPedido;
  set idPedido(String _value) {
    notifyListeners();

    _idPedido = _value;
  }

  String _totalPedido = '0';
  String get totalPedido => _totalPedido;
  set totalPedido(String _value) {
    notifyListeners();

    _totalPedido = _value;
  }

  String _urlNuevoPedido =
      'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/nuevo_pedido';
  String get urlNuevoPedido => _urlNuevoPedido;
  set urlNuevoPedido(String _value) {
    notifyListeners();

    _urlNuevoPedido = _value;
  }

  String _totalKilos = '0';
  String get totalKilos => _totalKilos;
  set totalKilos(String _value) {
    notifyListeners();

    _totalKilos = _value;
  }

  dynamic _jsonDetallePedido;
  dynamic get jsonDetallePedido => _jsonDetallePedido;
  set jsonDetallePedido(dynamic _value) {
    notifyListeners();

    _jsonDetallePedido = _value;
  }

  dynamic _jsonHistorial;
  dynamic get jsonHistorial => _jsonHistorial;
  set jsonHistorial(dynamic _value) {
    notifyListeners();

    _jsonHistorial = _value;
  }

  dynamic _jsonHistorialDetalle;
  dynamic get jsonHistorialDetalle => _jsonHistorialDetalle;
  set jsonHistorialDetalle(dynamic _value) {
    notifyListeners();

    _jsonHistorialDetalle = _value;
  }

  String _publicarApp = 'S';
  String get publicarApp => _publicarApp;
  set publicarApp(String _value) {
    notifyListeners();

    _publicarApp = _value;
    secureStorage.setString('ff_publicarApp', _value);
  }

  void deletePublicarApp() {
    notifyListeners();
    secureStorage.delete(key: 'ff_publicarApp');
  }

  String _utulizaNombreTicket = '';
  String get utulizaNombreTicket => _utulizaNombreTicket;
  set utulizaNombreTicket(String _value) {
    notifyListeners();

    _utulizaNombreTicket = _value;
  }

  dynamic _empresaTicket;
  dynamic get empresaTicket => _empresaTicket;
  set empresaTicket(dynamic _value) {
    notifyListeners();

    _empresaTicket = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
