import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/materiales/materiales_widget.dart';
import '/registro/registro_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtUsuario widget.
  FocusNode? txtUsuarioFocusNode;
  TextEditingController? txtUsuarioTextController;
  String? Function(BuildContext, String?)? txtUsuarioTextControllerValidator;
  // State field(s) for txtPassword widget.
  FocusNode? txtPasswordFocusNode;
  TextEditingController? txtPasswordTextController;
  late bool txtPasswordVisibility;
  String? Function(BuildContext, String?)? txtPasswordTextControllerValidator;
  // State field(s) for guardarInicioSesion widget.
  bool? guardarInicioSesionValue;
  // Stores action output result for [Backend Call - API (login)] action in btnIniciar widget.
  ApiCallResponse? jsonLogin;

  @override
  void initState(BuildContext context) {
    txtPasswordVisibility = false;
  }

  @override
  void dispose() {
    txtUsuarioFocusNode?.dispose();
    txtUsuarioTextController?.dispose();

    txtPasswordFocusNode?.dispose();
    txtPasswordTextController?.dispose();
  }
}
