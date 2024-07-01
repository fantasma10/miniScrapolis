import '/backend/api_requests/api_calls.dart';
import '/detalle_orden/detalle_orden_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home_page/home_page_widget.dart';
import '/menu_principal/menu_principal_widget.dart';
import '/modificar_cantidad/modificar_cantidad_widget.dart';
import '/modificar_precio/modificar_precio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'materiales_model.dart';
export 'materiales_model.dart';

class MaterialesWidget extends StatefulWidget {
  const MaterialesWidget({super.key});

  @override
  State<MaterialesWidget> createState() => _MaterialesWidgetState();
}

class _MaterialesWidgetState extends State<MaterialesWidget> {
  late MaterialesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MaterialesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiiMateriales = await ObtenerMaterialesCall.call(
        token: FFAppState().tokenUsuarioApp,
        pedido: FFAppState().idPedido,
      );

      if ((_model.apiiMateriales?.succeeded ?? true)) {
        FFAppState().listadoMateriales = getJsonField(
          (_model.apiiMateriales?.jsonBody ?? ''),
          r'''$.mensaje''',
        );
        FFAppState().update(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              getJsonField(
                (_model.apiiMateriales?.jsonBody ?? ''),
                r'''$.mensaje''',
              ).toString().toString(),
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
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 60.0,
                                  icon: Icon(
                                    Icons.menu_rounded,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.push(
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
                                      5.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Solicitudes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
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
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: Icon(
                                        Icons.person_remove,
                                        color: Colors.black,
                                        size: 40.0,
                                      ),
                                      onPressed: () async {
                                        _model.jsonEliminar =
                                            await EliminarUsuarioCall.call();

                                        if ((_model.jsonEliminar?.succeeded ??
                                            true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.jsonEliminar
                                                          ?.jsonBody ??
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
                                          Navigator.pushAndRemoveUntil(
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
                                                  (_model.jsonEliminar
                                                          ?.jsonBody ??
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Total: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Text(
                            FFAppState().totalPedido,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Kilos: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Text(
                            FFAppState().totalKilos,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            5.0, 15.0, 5.0, 20.0),
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
                                      5.0, 0.0, 5.0, 5.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 130.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x6DD2D2D2),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 0.0),
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
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 70.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        child: Image.network(
                                                          getJsonField(
                                                            listaMaterialesItem,
                                                            r'''$.url_imagen''',
                                                          ).toString(),
                                                          width: 70.0,
                                                          height: 70.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        3.0, 0.0, 3.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.75,
                                                  height: 90.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 5.0,
                                                                0.0, 5.0),
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
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      1.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
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
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            17.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 210.0,
                                                                  height: 40.0,
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
                                                                            210.0,
                                                                        height:
                                                                            35.0,
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 10.0, 0.0),
                                                                              child: FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 15.0,
                                                                                borderWidth: 0.0,
                                                                                buttonSize: 30.0,
                                                                                fillColor: FlutterFlowTheme.of(context).primariBagGroudBtn,
                                                                                icon: Icon(
                                                                                  Icons.horizontal_rule,
                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                  size: 15.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  _model.responseMaterialesResta = await NuevoPedidoCall.call(
                                                                                    material: getJsonField(
                                                                                      listaMaterialesItem,
                                                                                      r'''$.material_id''',
                                                                                    ).toString(),
                                                                                    pedido: FFAppState().idPedido,
                                                                                    cantidad: '-1',
                                                                                    token: FFAppState().tokenUsuarioApp,
                                                                                    tipo: '1',
                                                                                  );

                                                                                  if ((_model.responseMaterialesResta?.succeeded ?? true)) {
                                                                                    FFAppState().listadoMateriales = getJsonField(
                                                                                      (_model.responseMaterialesResta?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.detalles''',
                                                                                    );
                                                                                    FFAppState().totalPedido = getJsonField(
                                                                                      (_model.responseMaterialesResta?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.cabecera[0].total''',
                                                                                    ).toString();
                                                                                    FFAppState().update(() {});
                                                                                    FFAppState().totalKilos = getJsonField(
                                                                                      (_model.responseMaterialesResta?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.cabecera[0].total_kg''',
                                                                                    ).toString();
                                                                                    FFAppState().idPedido = getJsonField(
                                                                                      (_model.responseMaterialesResta?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.cabecera[0].pedido''',
                                                                                    ).toString();
                                                                                    FFAppState().update(() {});
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
                                                                                            (_model.responseMaterialesResta?.jsonBody ?? ''),
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
                                                                                    FFAppState().totalPedido = '0';
                                                                                    FFAppState().totalKilos = '0';
                                                                                    FFAppState().update(() {});
                                                                                    FFAppState().idPedido = '0';
                                                                                    FFAppState().update(() {});
                                                                                  }

                                                                                  setState(() {});
                                                                                },
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 100.0,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      Navigator.push(
                                                                                        context,
                                                                                        PageTransition(
                                                                                          type: PageTransitionType.scale,
                                                                                          alignment: Alignment.bottomCenter,
                                                                                          duration: Duration(milliseconds: 300),
                                                                                          reverseDuration: Duration(milliseconds: 300),
                                                                                          child: ModificarCantidadWidget(
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
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 17.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: FlutterFlowIconButton(
                                                                                borderColor: Colors.transparent,
                                                                                borderRadius: 15.0,
                                                                                borderWidth: 0.0,
                                                                                buttonSize: 30.0,
                                                                                fillColor: FlutterFlowTheme.of(context).primariBagGroudBtn,
                                                                                icon: Icon(
                                                                                  Icons.add,
                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                  size: 15.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  _model.responseMaterialesSuma = await NuevoPedidoCall.call(
                                                                                    material: getJsonField(
                                                                                      listaMaterialesItem,
                                                                                      r'''$.material_id''',
                                                                                    ).toString(),
                                                                                    pedido: FFAppState().idPedido,
                                                                                    cantidad: '1',
                                                                                    token: FFAppState().tokenUsuarioApp,
                                                                                    tipo: '1',
                                                                                  );

                                                                                  if ((_model.responseMaterialesSuma?.succeeded ?? true)) {
                                                                                    FFAppState().listadoMateriales = getJsonField(
                                                                                      (_model.responseMaterialesSuma?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.detalles''',
                                                                                    );
                                                                                    FFAppState().totalPedido = getJsonField(
                                                                                      (_model.responseMaterialesSuma?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.cabecera[0].total''',
                                                                                    ).toString();
                                                                                    FFAppState().update(() {});
                                                                                    FFAppState().totalKilos = getJsonField(
                                                                                      (_model.responseMaterialesSuma?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.cabecera[0].total_kg''',
                                                                                    ).toString();
                                                                                    FFAppState().idPedido = getJsonField(
                                                                                      (_model.responseMaterialesSuma?.jsonBody ?? ''),
                                                                                      r'''$.mensaje.cabecera[0].pedido''',
                                                                                    ).toString();
                                                                                    FFAppState().update(() {});
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
                                                                                            (_model.responseMaterialesSuma?.jsonBody ?? ''),
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
                                                                                    FFAppState().totalPedido = '0';
                                                                                    FFAppState().totalKilos = '0';
                                                                                    FFAppState().update(() {});
                                                                                    FFAppState().idPedido = '0';
                                                                                    FFAppState().update(() {});
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
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (FFAppState()
                                                                          .utilizamodificaprecio)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderWidth:
                                                                                0.0,
                                                                            buttonSize:
                                                                                50.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.monetization_on_outlined,
                                                                              color: FlutterFlowTheme.of(context).primariBagGroudBtn,
                                                                              size: 30.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              Navigator.push(
                                                                                context,
                                                                                PageTransition(
                                                                                  type: PageTransitionType.scale,
                                                                                  alignment: Alignment.bottomCenter,
                                                                                  duration: Duration(milliseconds: 300),
                                                                                  reverseDuration: Duration(milliseconds: 300),
                                                                                  child: ModificarPrecioWidget(
                                                                                    pIdMaterial: getJsonField(
                                                                                      listaMaterialesItem,
                                                                                      r'''$.material_id''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                                  5.0, 5.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Precio:  ',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
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
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Total:  ',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
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
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleOrdenWidget(),
                              ),
                            );
                          },
                          text: 'C O N T I N U A R',
                          options: FFButtonOptions(
                            width: 240.0,
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primariBagGroudBtn,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 4.0,
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
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
