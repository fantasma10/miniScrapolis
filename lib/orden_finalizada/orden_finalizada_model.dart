import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/historial_detalles/historial_detalles_widget.dart';
import '/menu_principal/menu_principal_widget.dart';
import 'orden_finalizada_widget.dart' show OrdenFinalizadaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdenFinalizadaModel extends FlutterFlowModel<OrdenFinalizadaWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Historial)] action in ordenFinalizada widget.
  ApiCallResponse? apiHistorial;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
