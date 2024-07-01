import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'modificar_cantidad_widget.dart' show ModificarCantidadWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModificarCantidadModel extends FlutterFlowModel<ModificarCantidadWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for precio widget.
  FocusNode? precioFocusNode;
  TextEditingController? precioTextController;
  String? Function(BuildContext, String?)? precioTextControllerValidator;
  // Stores action output result for [Backend Call - API (nuevoPedido)] action in Button widget.
  ApiCallResponse? responseMaterialesEdit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    precioFocusNode?.dispose();
    precioTextController?.dispose();
  }
}
