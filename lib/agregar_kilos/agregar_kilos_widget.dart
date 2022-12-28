import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../materiales/materiales_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgregarKilosWidget extends StatefulWidget {
  const AgregarKilosWidget({
    Key? key,
    this.pIdMaterial,
  }) : super(key: key);

  final String? pIdMaterial;

  @override
  _AgregarKilosWidgetState createState() => _AgregarKilosWidgetState();
}

class _AgregarKilosWidgetState extends State<AgregarKilosWidget> {
  ApiCallResponse? jsonPesaje;
  TextEditingController? textKilosController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textKilosController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textKilosController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 270,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                          child: Text(
                            'Ingresa la cantidad en kilos del material',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 10, 8, 0),
                          child: TextFormField(
                            controller: textKilosController,
                            onChanged: (_) => EasyDebounce.debounce(
                              'textKilosController',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Kilos',
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primariIcons,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primariIcons,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              suffixIcon: textKilosController!.text.isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        textKilosController?.clear();
                                        setState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFF757575),
                                        size: 22,
                                      ),
                                    )
                                  : null,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: FFButtonWidget(
                            onPressed: () async {
                              jsonPesaje = await NuevoPedidoCall.call(
                                pedido: FFAppState().idPedido,
                                material: widget.pIdMaterial,
                                cantidad: textKilosController!.text,
                                token: FFAppState().tokenUsuarioApp,
                                tipo: '2',
                              );
                              if ((jsonPesaje?.succeeded ?? true)) {
                                FFAppState().update(() {
                                  FFAppState().idPedido = getJsonField(
                                    (jsonPesaje?.jsonBody ?? ''),
                                    r'''$.mensaje.cabecera[0].pedido''',
                                  ).toString();
                                  FFAppState().totalPedido = getJsonField(
                                    (jsonPesaje?.jsonBody ?? ''),
                                    r'''$.mensaje.cabecera[0].total''',
                                  ).toString();
                                });
                                FFAppState().update(() {
                                  FFAppState().totalKilos = getJsonField(
                                    (jsonPesaje?.jsonBody ?? ''),
                                    r'''$.mensaje.cabecera[0].total_kg''',
                                  ).toString();
                                  FFAppState().listadoMateriales = getJsonField(
                                    (jsonPesaje?.jsonBody ?? ''),
                                    r'''$.mensaje.detalles''',
                                  );
                                });
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MaterialesWidget(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Error al registrar el peso',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .textColorBtn,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 2000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .tertiaryBagGroudBtn,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            text: 'AGREGAR',
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color: FlutterFlowTheme.of(context)
                                  .primariBagGroudBtn,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                              elevation: 4,
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
