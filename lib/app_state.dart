import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _usuario = await secureStorage.getString('ff_usuario') ?? _usuario;
    });
    await _safeInitAsync(() async {
      _password = await secureStorage.getString('ff_password') ?? _password;
    });
    await _safeInitAsync(() async {
      _guardaUsuarioPassword =
          await secureStorage.getBool('ff_guardaUsuarioPassword') ??
              _guardaUsuarioPassword;
    });
    await _safeInitAsync(() async {
      _tokenUsuarioApp = await secureStorage.getString('ff_tokenUsuarioApp') ??
          _tokenUsuarioApp;
    });
    await _safeInitAsync(() async {
      _publicarApp =
          await secureStorage.getString('ff_publicarApp') ?? _publicarApp;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _usuario = '';
  String get usuario => _usuario;
  set usuario(String value) {
    _usuario = value;
    secureStorage.setString('ff_usuario', value);
  }

  void deleteUsuario() {
    secureStorage.delete(key: 'ff_usuario');
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    secureStorage.setString('ff_password', value);
  }

  void deletePassword() {
    secureStorage.delete(key: 'ff_password');
  }

  bool _guardaUsuarioPassword = true;
  bool get guardaUsuarioPassword => _guardaUsuarioPassword;
  set guardaUsuarioPassword(bool value) {
    _guardaUsuarioPassword = value;
    secureStorage.setBool('ff_guardaUsuarioPassword', value);
  }

  void deleteGuardaUsuarioPassword() {
    secureStorage.delete(key: 'ff_guardaUsuarioPassword');
  }

  String _tokenUsuarioApp = '';
  String get tokenUsuarioApp => _tokenUsuarioApp;
  set tokenUsuarioApp(String value) {
    _tokenUsuarioApp = value;
    secureStorage.setString('ff_tokenUsuarioApp', value);
  }

  void deleteTokenUsuarioApp() {
    secureStorage.delete(key: 'ff_tokenUsuarioApp');
  }

  String _ocultaOpciones = '';
  String get ocultaOpciones => _ocultaOpciones;
  set ocultaOpciones(String value) {
    _ocultaOpciones = value;
  }

  dynamic _listadoMateriales;
  dynamic get listadoMateriales => _listadoMateriales;
  set listadoMateriales(dynamic value) {
    _listadoMateriales = value;
  }

  String _idPedido = '';
  String get idPedido => _idPedido;
  set idPedido(String value) {
    _idPedido = value;
  }

  String _totalPedido = '0';
  String get totalPedido => _totalPedido;
  set totalPedido(String value) {
    _totalPedido = value;
  }

  String _urlNuevoPedido =
      'https://www.miniscrapolis.scrapolis.mx/apiminiscrapolis/api/nuevo_pedido';
  String get urlNuevoPedido => _urlNuevoPedido;
  set urlNuevoPedido(String value) {
    _urlNuevoPedido = value;
  }

  String _totalKilos = '0';
  String get totalKilos => _totalKilos;
  set totalKilos(String value) {
    _totalKilos = value;
  }

  dynamic _jsonDetallePedido;
  dynamic get jsonDetallePedido => _jsonDetallePedido;
  set jsonDetallePedido(dynamic value) {
    _jsonDetallePedido = value;
  }

  dynamic _jsonHistorial;
  dynamic get jsonHistorial => _jsonHistorial;
  set jsonHistorial(dynamic value) {
    _jsonHistorial = value;
  }

  dynamic _jsonHistorialDetalle;
  dynamic get jsonHistorialDetalle => _jsonHistorialDetalle;
  set jsonHistorialDetalle(dynamic value) {
    _jsonHistorialDetalle = value;
  }

  String _publicarApp = 'S';
  String get publicarApp => _publicarApp;
  set publicarApp(String value) {
    _publicarApp = value;
    secureStorage.setString('ff_publicarApp', value);
  }

  void deletePublicarApp() {
    secureStorage.delete(key: 'ff_publicarApp');
  }

  String _utulizaNombreTicket = '';
  String get utulizaNombreTicket => _utulizaNombreTicket;
  set utulizaNombreTicket(String value) {
    _utulizaNombreTicket = value;
  }

  dynamic _empresaTicket;
  dynamic get empresaTicket => _empresaTicket;
  set empresaTicket(dynamic value) {
    _empresaTicket = value;
  }

  bool _utilizamodificaprecio = false;
  bool get utilizamodificaprecio => _utilizamodificaprecio;
  set utilizamodificaprecio(bool value) {
    _utilizamodificaprecio = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

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
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
