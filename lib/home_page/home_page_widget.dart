import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/materiales/materiales_widget.dart';
import '/registro/registro_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.txtUsuarioTextController ??=
        TextEditingController(text: FFAppState().usuario);
    _model.txtUsuarioFocusNode ??= FocusNode();

    _model.txtPasswordTextController ??=
        TextEditingController(text: FFAppState().password);
    _model.txtPasswordFocusNode ??= FocusNode();
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
      backgroundColor: FlutterFlowTheme.of(context).tertiary,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          )
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl:
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/cuisi-sucursales-f1glia/assets/tqgn1wj5soul/LogoInterior.png',
                                width: 250.0,
                                height: 150.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 80.0, 15.0, 0.0),
                              child: TextFormField(
                                controller: _model.txtUsuarioTextController,
                                focusNode: _model.txtUsuarioFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.txtUsuarioTextController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'email',
                                  hintText: 'ingresa tu email',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primariIcons,
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: FlutterFlowTheme.of(context)
                                        .primariIcons,
                                  ),
                                  suffixIcon: _model.txtUsuarioTextController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.txtUsuarioTextController
                                                ?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                keyboardType: TextInputType.emailAddress,
                                validator: _model
                                    .txtUsuarioTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 8.0, 15.0, 0.0),
                              child: TextFormField(
                                controller: _model.txtPasswordTextController,
                                focusNode: _model.txtPasswordFocusNode,
                                obscureText: !_model.txtPasswordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña\n',
                                  hintText: 'ingresa tu contraseña',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primariIcons,
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primariIcons,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.txtPasswordVisibility =
                                          !_model.txtPasswordVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.txtPasswordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model
                                    .txtPasswordTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.black,
                                ),
                                child: CheckboxListTile(
                                  value: _model.guardarInicioSesionValue ??=
                                      FFAppState().guardaUsuarioPassword,
                                  onChanged: (newValue) async {
                                    setState(() => _model
                                        .guardarInicioSesionValue = newValue!);
                                  },
                                  title: Text(
                                    'Recordar inicio de sesión',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primariIcons,
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.txtUsuarioTextController.text !=
                                          null &&
                                      _model.txtUsuarioTextController.text !=
                                          '') {
                                    if (_model.txtPasswordTextController.text !=
                                            null &&
                                        _model.txtPasswordTextController.text !=
                                            '') {
                                      _model.jsonLogin = await LoginCall.call(
                                        email: _model
                                            .txtUsuarioTextController.text,
                                        password: _model
                                            .txtPasswordTextController.text,
                                      );

                                      if ((_model.jsonLogin?.succeeded ??
                                          true)) {
                                        FFAppState().tokenUsuarioApp =
                                            getJsonField(
                                          (_model.jsonLogin?.jsonBody ?? ''),
                                          r'''$.token''',
                                        ).toString();
                                        FFAppState().usuario = _model
                                            .txtUsuarioTextController.text;
                                        FFAppState().update(() {});
                                        FFAppState().password = _model
                                            .txtPasswordTextController.text;
                                        FFAppState().idPedido = '0';
                                        FFAppState().update(() {});
                                        FFAppState().publicarApp = getJsonField(
                                          (_model.jsonLogin?.jsonBody ?? ''),
                                          r'''$.publicar_app''',
                                        ).toString();
                                        FFAppState().guardaUsuarioPassword =
                                            true;
                                        FFAppState().update(() {});
                                        FFAppState().totalPedido = '0';
                                        FFAppState().totalKilos = '0';
                                        FFAppState().update(() {});
                                        FFAppState().utulizaNombreTicket =
                                            getJsonField(
                                          (_model.jsonLogin?.jsonBody ?? ''),
                                          r'''$.utiliza_nombre_ticket''',
                                        ).toString();
                                        FFAppState().empresaTicket =
                                            getJsonField(
                                          (_model.jsonLogin?.jsonBody ?? ''),
                                          r'''$.empresa''',
                                        );
                                        FFAppState().update(() {});
                                        FFAppState().utilizamodificaprecio =
                                            getJsonField(
                                          (_model.jsonLogin?.jsonBody ?? ''),
                                          r'''$.utiliza_modifica_precio''',
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MaterialesWidget(),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.jsonLogin?.jsonBody ??
                                                    ''),
                                                r'''$.mensaje''',
                                              ).toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryBagGroudBtn,
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'La contraseña es un campo obligatorio',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiaryBagGroudBtn,
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'El email es un campo obligatorio',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiaryBagGroudBtn,
                                      ),
                                    );
                                  }

                                  setState(() {});
                                },
                                text: 'Iniciar',
                                options: FFButtonOptions(
                                  width: 240.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primariBagGroudBtn,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 4.0,
                                  borderSide: BorderSide(
                                    color: Color(0xFFF2F3F6),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            if (FFAppState().publicarApp == 'S')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegistroWidget(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Registrarme',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 40.0, 0.0, 0.0),
                              child: Text(
                                'Version 2.0',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
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
          ),
        ],
      ),
    );
  }
}
