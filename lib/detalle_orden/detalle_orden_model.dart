import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/materiales/materiales_widget.dart';
import '/ticket/ticket_widget.dart';
import 'detalle_orden_widget.dart' show DetalleOrdenWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetalleOrdenModel extends FlutterFlowModel<DetalleOrdenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (detallePedido)] action in detalleOrden widget.
  ApiCallResponse? apiiDetalles;
  // State field(s) for txtNombre widget.
  FocusNode? txtNombreFocusNode;
  TextEditingController? txtNombreTextController;
  String? Function(BuildContext, String?)? txtNombreTextControllerValidator;
  // Stores action output result for [Backend Call - API (finalizarPedido)] action in Button widget.
  ApiCallResponse? jsonFinalizar;
  // Stores action output result for [Backend Call - API (HistorialDetalle)] action in Button widget.
  ApiCallResponse? apiiHistorialDetalleT;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtNombreFocusNode?.dispose();
    txtNombreTextController?.dispose();
  }
}
