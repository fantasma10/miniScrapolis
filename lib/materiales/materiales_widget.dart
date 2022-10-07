import '../agregar_kilos/agregar_kilos_widget.dart';
import '../backend/api_requests/api_calls.dart';
import '../detalle_orden/detalle_orden_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import '../menu_principal/menu_principal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialesWidget extends StatefulWidget {
  const MaterialesWidget({Key? key}) : super(key: key);

  @override
  _MaterialesWidgetState createState() => _MaterialesWidgetState();
}

class _MaterialesWidgetState extends State<MaterialesWidget> {
  ApiCallResponse? apiiMateriales;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ApiCallResponse? jsonEliminar;
  ApiCallResponse? responseMaterialesResta;
  ApiCallResponse? responseMaterialesSuma;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      apiiMateriales = await ObtenerMaterialesCall.call(
        token: FFAppState().tokenUsuarioApp,
        pedido: FFAppState().idPedido,
      );
      if ((apiiMateriales?.succeeded ?? true)) {
        setState(() => FFAppState().listadoMateriales = getJsonField(
              (apiiMateriales?.jsonBody ?? ''),
              r'''$.mensaje''',
            ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (apiiMateriales?.jsonBody ?? ''),
                r'''$.mensaje''',
              ).toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 2000),
            backgroundColor: FlutterFlowTheme.of(context).tertiaryBagGroudBtn,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 15, 0, 0),
                        child: Row(
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
                                    Icons.menu_rounded,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.scale,
                                        alignment: Alignment.bottomCenter,
                                        duration: Duration(milliseconds: 300),
                                        reverseDuration:
                                            Duration(milliseconds: 300),
                                        child: MenuPrincipalWidget(),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Text(
                                    'Solicitudes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 17,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (FFAppState().publicarApp == 'S')
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.person_remove,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                      onPressed: () async {
                                        jsonEliminar =
                                            await EliminarUsuarioCall.call();
                                        if ((jsonEliminar?.succeeded ?? true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (jsonEliminar?.jsonBody ??
                                                      ''),
                                                  r'''$.mensaje''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePageWidget(),
                                            ),
                                            (r) => false,
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (jsonEliminar?.jsonBody ??
                                                      ''),
                                                  r'''$.mesnaje''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryBagGroudBtn,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                        }

                                        setState(() {});
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              'Total: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Text(
                            FFAppState().totalPedido,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              'Kilos: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Text(
                            FFAppState().totalKilos,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 20),
                        child: Builder(
                          builder: (context) {
                            final listaMateriales = getJsonField(
                              FFAppState().listadoMateriales,
                              r'''$''',
                            ).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: listaMateriales.length,
                              itemBuilder: (context, listaMaterialesIndex) {
                                final listaMaterialesItem =
                                    listaMateriales[listaMaterialesIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Color(0x6DD2D2D2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Container(
                                                      width: 60,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        child: Image.network(
                                                          getJsonField(
                                                            listaMaterialesItem,
                                                            r'''$.url_imagen''',
                                                          ),
                                                          width: 70,
                                                          height: 70,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(3, 0, 3, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.7,
                                                  height: 90,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 5, 0, 5),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      1, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    listaMaterialesItem,
                                                                    r'''$.material''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      5, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 210,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          210,
                                                                      height:
                                                                          35,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                0,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 15,
                                                                              borderWidth: 0,
                                                                              buttonSize: 30,
                                                                              fillColor: FlutterFlowTheme.of(context).primariBagGroudBtn,
                                                                              icon: Icon(
                                                                                Icons.horizontal_rule,
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                size: 15,
                                                                              ),
                                                                              onPressed: () async {
                                                                                responseMaterialesResta = await NuevoPedidoCall.call(
                                                                                  material: getJsonField(
                                                                                    listaMaterialesItem,
                                                                                    r'''$.material_id''',
                                                                                  ).toString(),
                                                                                  pedido: FFAppState().idPedido,
                                                                                  cantidad: '-1',
                                                                                  token: FFAppState().tokenUsuarioApp,
                                                                                  tipo: '1',
                                                                                );
                                                                                if ((responseMaterialesResta?.succeeded ?? true)) {
                                                                                  setState(() => FFAppState().listadoMateriales = getJsonField(
                                                                                        (responseMaterialesResta?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.detalles''',
                                                                                      ));
                                                                                  setState(() => FFAppState().totalPedido = getJsonField(
                                                                                        (responseMaterialesResta?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.cabecera[0].total''',
                                                                                      ).toString());
                                                                                  setState(() => FFAppState().totalKilos = getJsonField(
                                                                                        (responseMaterialesResta?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.cabecera[0].total_kg''',
                                                                                      ).toString());
                                                                                  setState(() => FFAppState().idPedido = getJsonField(
                                                                                        (responseMaterialesResta?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.cabecera[0].pedido''',
                                                                                      ).toString());
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Operación realizada',
                                                                                        style: TextStyle(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 2000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).primariBagGroudBtn,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        getJsonField(
                                                                                          (responseMaterialesResta?.jsonBody ?? ''),
                                                                                          r'''$.mensaje''',
                                                                                        ).toString(),
                                                                                        style: TextStyle(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 2000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).tertiaryBagGroudBtn,
                                                                                    ),
                                                                                  );
                                                                                  setState(() => FFAppState().totalPedido = '0');
                                                                                  setState(() => FFAppState().totalKilos = '0');
                                                                                  setState(() => FFAppState().idPedido = '0');
                                                                                }

                                                                                setState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    await Navigator.push(
                                                                                      context,
                                                                                      PageTransition(
                                                                                        type: PageTransitionType.scale,
                                                                                        alignment: Alignment.bottomCenter,
                                                                                        duration: Duration(milliseconds: 300),
                                                                                        reverseDuration: Duration(milliseconds: 300),
                                                                                        child: AgregarKilosWidget(
                                                                                          pIdMaterial: getJsonField(
                                                                                            listaMaterialesItem,
                                                                                            r'''$.material_id''',
                                                                                          ).toString(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      listaMaterialesItem,
                                                                                      r'''$.cantidad''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 17,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 15,
                                                                              borderWidth: 0,
                                                                              buttonSize: 30,
                                                                              fillColor: FlutterFlowTheme.of(context).primariBagGroudBtn,
                                                                              icon: Icon(
                                                                                Icons.add,
                                                                                color: FlutterFlowTheme.of(context).lineColor,
                                                                                size: 15,
                                                                              ),
                                                                              onPressed: () async {
                                                                                responseMaterialesSuma = await NuevoPedidoCall.call(
                                                                                  material: getJsonField(
                                                                                    listaMaterialesItem,
                                                                                    r'''$.material_id''',
                                                                                  ).toString(),
                                                                                  pedido: FFAppState().idPedido,
                                                                                  cantidad: '1',
                                                                                  token: FFAppState().tokenUsuarioApp,
                                                                                  tipo: '1',
                                                                                );
                                                                                if ((responseMaterialesSuma?.succeeded ?? true)) {
                                                                                  setState(() => FFAppState().listadoMateriales = getJsonField(
                                                                                        (responseMaterialesSuma?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.detalles''',
                                                                                      ));
                                                                                  setState(() => FFAppState().totalPedido = getJsonField(
                                                                                        (responseMaterialesSuma?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.cabecera[0].total''',
                                                                                      ).toString());
                                                                                  setState(() => FFAppState().totalKilos = getJsonField(
                                                                                        (responseMaterialesSuma?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.cabecera[0].total_kg''',
                                                                                      ).toString());
                                                                                  setState(() => FFAppState().idPedido = getJsonField(
                                                                                        (responseMaterialesSuma?.jsonBody ?? ''),
                                                                                        r'''$.mensaje.cabecera[0].pedido''',
                                                                                      ).toString());
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Operación realizada',
                                                                                        style: TextStyle(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 1000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).primariBagGroudBtn,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        getJsonField(
                                                                                          (responseMaterialesSuma?.jsonBody ?? ''),
                                                                                          r'''$.mensaje''',
                                                                                        ).toString(),
                                                                                        style: TextStyle(
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 2000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).tertiaryBagGroudBtn,
                                                                                    ),
                                                                                  );
                                                                                  setState(() => FFAppState().totalPedido = '0');
                                                                                  setState(() => FFAppState().totalKilos = '0');
                                                                                  setState(() => FFAppState().idPedido = '0');
                                                                                }

                                                                                setState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  'Precio:  ',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  listaMaterialesItem,
                                                  r'''$.precio''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  'Total:  ',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  listaMaterialesItem,
                                                  r'''$.total''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    if (FFAppState().totalKilos != '0')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleOrdenWidget(),
                              ),
                            );
                          },
                          text: 'C O N T I N U A R',
                          options: FFButtonOptions(
                            width: 240,
                            height: 50,
                            color:
                                FlutterFlowTheme.of(context).primariBagGroudBtn,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
          ),
        ],
      ),
    );
  }
}
