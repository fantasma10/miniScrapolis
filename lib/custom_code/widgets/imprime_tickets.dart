// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils.dart';
import 'package:image/image.dart' as Imag;
import 'package:json_response/json_response.dart';

class ImprimeTickets extends StatefulWidget {
  const ImprimeTickets({
    Key? key,
    this.width,
    this.height,
    required this.nombre,
    required this.email,
    required this.total,
    required this.listadoArticulos,
    required this.fecha,
    required this.id,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String nombre;
  final String email;
  final String total;
  final dynamic listadoArticulos;
  final String fecha;
  final String id;

  @override
  _ImprimeTicketsState createState() => _ImprimeTicketsState();
}

class _ImprimeTicketsState extends State<ImprimeTickets> {
  String _info = "";
  String _msj = 'Busca la(s) impresora(s) configurada(s) en tu dispositivo';
  bool connected = false;
  List<BluetoothInfo> items = [];
  List<String> _options = [
    "permission bluetooth granted",
    "bluetooth enabled",
    "connection status",
    "update info"
  ];

  bool _connceting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_msj),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  this.getBluetoots();
                },
                child: Row(
                  children: [
                    Visibility(
                      visible: _connceting,
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                            strokeWidth: 1, backgroundColor: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(_connceting ? "Conectando" : "Buscar impresora"),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: connected ? this.disconnect : null,
                child: Text("Desconectar"),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.withOpacity(0.3),
              ),
              child: ListView.builder(
                itemCount: items.length > 0 ? items.length : 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      String mac = items[index].macAdress;
                      this.connect(mac);
                    },
                    title: Text('Nombre: ${items[index].name}'),
                    subtitle: Text("macAdress: ${items[index].macAdress}"),
                  );
                },
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: connected ? this.printScrapolis : null,
            child: Text("Imprimir comprobante"),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Future<void> getBluetoots() async {
    final List<BluetoothInfo> listResult =
        await PrintBluetoothThermal.pairedBluetooths;

    /*await Future.forEach(listResult, (BluetoothInfo bluetooth) {
      String name = bluetooth.name;
      String mac = bluetooth.macAdress;
    });*/

    if (listResult.length == 0) {
      _msj = "No hay bluetoohs vinculados, ve a ajustes y vincula la impresora";
    } else {
      _msj = "Toque un elemento de la lista para conectarse";
    }

    setState(() {
      items = listResult;
    });
  }

  Future<void> connect(String mac) async {
    disconnect();
    setState(() {
      _connceting = true;
    });
    final bool result =
        await PrintBluetoothThermal.connect(macPrinterAddress: mac);
    print("state conected $result");
    if (result) connected = true;
    setState(() {
      _connceting = false;
    });
  }

  Future<void> disconnect() async {
    final bool status = await PrintBluetoothThermal.disconnect;
    setState(() {
      connected = false;
    });
    print("Desconectado $status");
  }

  Future<void> printScrapolis() async {
    bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
    if (conexionStatus) {
      List<int> ticket = await Ticket();
      final result = await PrintBluetoothThermal.writeBytes(ticket);
    } else {
      //no conectado, reconecte
    }
  }

  Future<List<int>> Ticket() async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    //bytes += generator.setGlobalFont(PosFontType.fontA);
    bytes += generator.reset();

    if (FFAppState().utulizaNombreTicket == "S") {
      /* Int8List? _bytes;
      final ByteData data = await NetworkAssetBundle(Uri.parse(  FFAppState().empresaTicket['logotipo'].toString() )).load( FFAppState().empresaTicket['logotipo'].toString() );
      _bytes = data.buffer.asInt8List();
    final image = Imag.decodeImage(_bytes);
    // Using `ESC *`
    bytes += generator.image(image!);*/

      bytes += generator.text(
          FFAppState().empresaTicket['nombre_empresa'].toString(),
          styles: PosStyles(
              align: PosAlign.center,
              height: PosTextSize.size3,
              width: PosTextSize.size3,
              bold: true));

      var direccion = FFAppState().empresaTicket['calle'].toString() +
          ", " +
          FFAppState().empresaTicket['colonia'].toString() +
          ", " +
          FFAppState().empresaTicket['codigo_postal'].toString() +
          ", " +
          FFAppState().empresaTicket['ciudad'].toString() +
          ", " +
          FFAppState().empresaTicket['estado'].toString();
      bytes += generator.text(
        direccion,
        styles: PosStyles(
          bold: true,
          fontType: PosFontType.fontA,
        ),
      );
      bytes += generator.text(
        ("Telefono: " + FFAppState().empresaTicket['telefono'].toString()),
        styles: PosStyles(
          bold: true,
          fontType: PosFontType.fontA,
        ),
      );
      bytes += generator.text(
        ("Email: " + FFAppState().empresaTicket['email'].toString()),
        styles: PosStyles(
          bold: true,
          fontType: PosFontType.fontA,
        ),
      );
    }

    bytes += generator.feed(1);

    bytes += generator.text(
      "Folio: " + widget.id ?? "",
      styles: PosStyles(
        fontType: PosFontType.fontA,
      ),
    );

    bytes += generator.text(
      widget.nombre ?? "",
      styles: PosStyles(
        fontType: PosFontType.fontA,
      ),
    );
    bytes += generator.text(
      widget.email ?? "",
      styles: PosStyles(
        fontType: PosFontType.fontA,
      ),
    );

    bytes += generator.text(
      "Fecha: " + widget.fecha ?? "",
      styles: PosStyles(
        fontType: PosFontType.fontA,
      ),
    );

    bytes += generator.feed(2);
    //Articulos
    (FFAppState().jsonHistorialDetalle as List<dynamic>).forEach((item) {
      bytes += generator.text(
        item['material'].toString(),
        styles: PosStyles(
          bold: true,
          fontType: PosFontType.fontA,
        ),
      );
      String articulo = "Unidad/Kg: " +
          item['cantidad'].toString() +
          " Precio: \$" +
          item['precio_unitario'].toString();
      bytes += generator.text(
        articulo,
        styles: PosStyles(
          fontType: PosFontType.fontA,
        ),
      );
      articulo = " Total:" + item['total'].toString();
      bytes += generator.text(
        articulo,
        styles: PosStyles(
          fontType: PosFontType.fontA,
        ),
      );
      bytes += generator.feed(1);
    });

    bytes += generator.text(('Total:' + widget.total ?? ''),
        styles: PosStyles(
            height: PosTextSize.size2, width: PosTextSize.size2, bold: false));

    bytes += generator.feed(3);

    bytes += generator.cut();
    return bytes;
  }
}
